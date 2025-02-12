import 'package:flutter/material.dart';

Widget text({
  required String val,
  TextAlign? textAlign,
  TextDirection? textDirection,
  TextOverflow? overflow,
  int? maxLines,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Text(
    val,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}
