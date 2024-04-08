
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {


  final Color? textColor;
  final String text;
  final bool loading;
  final Color? color;
  final TextStyle? style;
  final double? width;
  final Function() onTap;
  const CustomButton({
    this.loading = false,
    this.color,
    this.width,
    this.style,
    required this.onTap,
    this.text = 'Submit',
    this.textColor,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20)),
          height: 60,
          width:  width?? 120 ,
          child: (loading)
              ? const SizedBox(
              height: 30,
              width: 30,
              child: Center(child: CircularProgressIndicator(color: Colors.white,)))
              : Text(
            text,
            style: style
        ),
      ),
    ));
  }
}
//GoogleFonts.nunitoSans(color: const Color(0xFFA9A9A9),fontSize: 18.sp),