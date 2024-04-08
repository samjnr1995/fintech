import 'package:fintech/Login_folder/after_password_reset_screen.dart';
import 'package:fintech/components/custom_fields.dart';
import 'package:fintech/components/custon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../components/labels.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _passwordFeedback = '';
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
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
                  Labels.login,
                  style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF323438),
                      fontWeight: FontWeight.w700,
                      fontSize: 28.sp),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  Labels.signInWithDetails,
                  style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF323438),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  Labels.emailAddress,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 12.sp, color: const Color(0xFF838383)),
                ),
                CustomField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Labels.emailRequired;
                      } else if (!RegExp(Labels.emailRex)
                          .hasMatch(value)) {
                        return Labels.invalidEmail;
                      }
                      return null;
                    },
                    preIcon: Icons.phone, color:  const Color(0xFFC3083B),
                    hint: Labels.emailAddress,
                    type: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Labels.temporaryPassword,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 12.sp, color: const Color(0xFF838383)),
                ),
                CustomField(
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
                  hint: Labels.enterPassword,
                  type: TextInputType.text,
                  preIcon: Icons.lock,color: const Color(0xFFC3083B),
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
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onTap: () {
                    if(_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AfterPasswordScreen()));
                    }
                  },
                  text: Labels.createNewPassword,
                  style: GoogleFonts.nunitoSans(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  color: const Color(0xFFC3083B),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
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
