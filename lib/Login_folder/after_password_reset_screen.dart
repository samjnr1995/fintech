import 'package:fintech/components/custom_fields.dart';
import 'package:fintech/components/custon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../components/labels.dart';

class AfterPasswordScreen extends StatefulWidget {
  const AfterPasswordScreen({super.key});

  @override
  State<AfterPasswordScreen> createState() => _AfterPasswordScreenState();
}

class _AfterPasswordScreenState extends State<AfterPasswordScreen> {
  bool _passwordInVisible = true;
  String _passwordFeedback = '';
  final passwordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final confirmPasswordEditingController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  Labels.createNewPassword,
                  style: GoogleFonts.manrope(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF323438),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  Labels.afterPasswordReset,
                  style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF323438),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  Labels.createNewPassword,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: const Color(0xFF838383),
                  ),
                ),
                CustomField(
                  obs: _passwordInVisible,
                  preIcon: Icons.password,
                  onChanged: (value) {
                    setState(() {
                      _passwordFeedback = _validatePassword(value);
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Labels.passwordRequired;
                    }
                    return null;
                  },
                  click: () {
                    setState(() {
                      _passwordInVisible = !_passwordInVisible;
                    });
                  },
                  icon: _passwordInVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  data: passwordEditingController,
                  hint: Labels.password,
                  type: TextInputType.text,

                ),

                Text(
                  Labels.passwordRequirement,
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                      color: const Color(0xFF323438)),
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  Labels.confirmNerPassword,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: const Color(0xFF838383),
                  ),
                ),
                if (_passwordFeedback.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 4),
                    child: Text(
                      _passwordFeedback,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                CustomField(
                  obs: _passwordInVisible,
                  preIcon: Icons.password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Labels.requiredField;
                    } else if (value != passwordEditingController.text) {
                      return Labels.mismatch;
                    }
                    return null;
                  },
                  data: confirmPasswordEditingController,
                  hint: Labels.enterPassword,
                  type: TextInputType.text,
                  click: () {
                    setState(() {
                      _passwordInVisible = !_passwordInVisible;
                    });
                  },
                  onChanged: (value) {
                    value = confirmPasswordEditingController.text;
                  },
                  icon: _passwordInVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                const SizedBox(
                  height: 120,
                ),
                CustomButton(
                  onTap: () {
                    if(_formKey.currentState!.validate()) {
                      _showResetPasswordDialog(context);
                    }
                  },
                  text: Labels.continu,
                  color: const Color(0xFFC3083B),
                  style: GoogleFonts.nunitoSans(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showResetPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            Labels.passwordSet,
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: const Color(0xFF2D2D3D)),
          ),
        ),
        content: Text(
          Labels.passwordSuccessfullySet,
          style: GoogleFonts.nunitoSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF2B9B5B),
              ),
              child: TextButton(
                onPressed: () {
                  // Perform reset password action here
                  // Close the dialog
                },
                child: Center(
                    child: Text(
                  Labels.continu,
                  style:  GoogleFonts.nunitoSans(color:  Colors.white,fontSize: 18.sp),
                )),
              ),
            ),
          ),
        ],
      );
    },
  );
}
String _validatePassword(String value) {
  if (value.isEmpty) {
    return Labels.passwordRequired;
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters';
  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  } else if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least one digit';
  } else if (!RegExp(r'[!@#$%^&*()_+]').hasMatch(value)) {
    return 'Password must contain at least one special character';
  }
  return '';
}