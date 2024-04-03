import 'package:fintech/Login_folder/reset_password.dart';
import 'package:fintech/components/custom_fields.dart';
import 'package:fintech/components/custon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../components/labels.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 85,
                ),
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
                  Labels.pleaseEnterDetails,
                  style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF323438),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  Labels.emailAddress,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 12.sp, color: const Color(0xFF838383)),
                ),
                const CustomField(
                    hint: Labels.emailAddress,
                    type: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Labels.password,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 12.sp, color: const Color(0xFF838383)),
                ),
                const CustomField(
                  hint: Labels.enterPassword,
                  type: TextInputType.text,
                  preIcon: Icons.lock,
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPassword()));
                  },
                  child: Center(
                    child: Text(
                      Labels.resetPassword,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF838383)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF838383)),
                      borderRadius: BorderRadius.circular(15)),
                  child: CustomButton(
                    onTap: () {},
                    text: Labels.login,
                    color: const Color(0xFFFFFFFF),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
