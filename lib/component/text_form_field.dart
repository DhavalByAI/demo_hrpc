import 'package:demo_hrpc/component/color_cmp.dart';
import 'package:flutter/material.dart';

Widget textFormField({
  required TextEditingController controller,
  String? hintText,
  Widget? label,
  String? labelText,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  int? maxLines = 1,
  int? minLines,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    onChanged: onChanged,
    maxLines: maxLines,
    minLines: minLines,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    decoration: InputDecoration(
      hintText: hintText,
      label: label,
      labelText: labelText,
      labelStyle: TextStyle(
        color: colorCmp.blackColor,
        fontWeight: FontWeight.w600,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: colorCmp.greyColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: colorCmp.blackColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: colorCmp.blackColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: colorCmp.redColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: colorCmp.redColor),
      ),
    ),
  );
}
