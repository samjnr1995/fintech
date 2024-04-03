import 'package:fintech/Login_folder/create_new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../components/custom_fields.dart';
import '../components/custon_button.dart';
import '../components/labels.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Labels.resetPassword,
                style: GoogleFonts.nunitoSans(
                    fontSize: 28.sp, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                Labels.pleaseInputEmail,
                style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF323438),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                Labels.emailAddress,
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: const Color(0xFF838383)),
              ),
              const CustomField(
                hint: Labels.suduu,
                type: TextInputType.emailAddress,
                preIcon: Icons.phone ,
              ),
              const SizedBox(
                height: 90,
              ),
              CustomButton(
                onTap: () {
                  _showResetPasswordDialog(context);
                },
                text: Labels.validateEmail,
                color: const Color(0xFFC3083B),
              )
            ],
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
            Labels.passwordReset,
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: const Color(0xFF2D2D3D)),
          ),
        ),
        content: Text(
          Labels.temporaryGeneratedPassword,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const NewPasswordScreen())); // Close the dialog
                },
                child: Center(
                    child: Text(
                  Labels.continu,
                  style: GoogleFonts.nunitoSans(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ),
        ],
      );
    },
  );
}
