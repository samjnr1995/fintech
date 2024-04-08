import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CustomField extends StatelessWidget {
  final String hint;
  final AutovalidateMode? val;
  final String? actualHint;
  final Color? textColor;
  final bool isMap;
  final bool isDisabled;
  final bool readOnly;
  final IconData? icon;

  final IconData? preIcon;
  final int? maxlines;
  final int? maxlength;
  final Function()? click;
  final Color? color;
  final TextEditingController? data;
  final TextInputType type;
  final bool obs;
  final String? Function(String?)? validator;
  final Function(String)? submit;
  final Function(String)? onChanged;
  final TextCapitalization? tc;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  const CustomField({
    Key? key,
    required this.hint,
    this.color,
    required this.type,
    this.preIcon,
    this.actualHint,
    this.val,
    this.onChanged,
    this.icon,
    this.readOnly = false,
    this.maxlines,
    this.maxlength,
    this.click,
    this.textColor,
    this.data,
    this.validator,
    this.submit,
    this.tc,
    this.isMap = false,
    this.isDisabled = false,
    this.obs = false,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        readOnly: readOnly,
        autovalidateMode: val,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        maxLength: maxlength,
        enabled: !isDisabled,
        onFieldSubmitted: submit,
        textCapitalization: tc ?? TextCapitalization.none,
        validator: validator,
        onChanged: onChanged,
        obscureText: obs,
        keyboardType: type,
        controller: data,
        maxLines: maxlines ?? 1,
        cursorColor: Colors.grey,
        style: const TextStyle(
          fontFamily: 'Poppins', fontSize: 14,),
        decoration: InputDecoration(
          fillColor: isMap ? Colors.white : null,
          filled: isMap,
          isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          hintText: actualHint ?? hint,
          alignLabelWithHint: true,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.3),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFC30A3B),
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
          errorStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Colors.red,
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 35,
            minHeight: 30,
          ),
          prefixIcon: preIcon == null
              ? null
              : Icon(
            preIcon,
            color: color,
          ),
          suffixIcon: IconButton(
            onPressed: click,
            icon: Icon(
              icon,
              size: 18,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}