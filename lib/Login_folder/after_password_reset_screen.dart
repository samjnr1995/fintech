import 'package:fintech/components/custom_fields.dart';
import 'package:fintech/components/custon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../components/labels.dart';

class AfterPasswordScreen extends StatelessWidget {
  const AfterPasswordScreen({super.key});

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
              const CustomField(
                hint: Labels.enterYourPassword,
                type: TextInputType.emailAddress,
                icon: Icons.remove_red_eye,
              ),
              Text(
                Labels.passwordRequirement,
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                    color: const Color(0xFF323438)),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  Text(
                    Labels.oneLowerCase,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 10.sp,
                        color: const Color(0xFF323438),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  Text(
                    Labels.oneUpperCase,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 10.sp,
                        color: const Color(0xFF323438),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  Text(
                    Labels.oneDigit,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 10.sp,
                        color: const Color(0xFF323438),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  Text(
                    Labels.oneSpecialCharacter,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 10.sp,
                        color: const Color(0xFF323438),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                Labels.confirmNerPassword,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: const Color(0xFF838383),
                ),
              ),
              const CustomField(
                hint: Labels.enterYourPassword,
                type: TextInputType.emailAddress,
                icon: Icons.remove_red_eye,
              ),
              const SizedBox(
                height: 120,
              ),
              CustomButton(
                onTap: () {
                  _showResetPasswordDialog(context);
                },
                text: Labels.continu,
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
