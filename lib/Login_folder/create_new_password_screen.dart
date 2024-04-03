import 'package:fintech/Login_folder/after_password_reset_screen.dart';
import 'package:fintech/components/custom_fields.dart';
import 'package:fintech/components/custon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../components/labels.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
              const CustomField(
                  preIcon: Icons.phone,
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
              const CustomField(
                preIcon: Icons.lock,
                hint: Labels.password,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AfterPasswordScreen()));
                },
                text: Labels.createNewPassword,
                color: const Color(0xFFC3083B),
              )
            ],
          ),
        ),
      ),
    );
  }
}
