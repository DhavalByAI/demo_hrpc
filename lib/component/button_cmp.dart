import 'package:demo_hrpc/component/color_cmp.dart';
import 'package:demo_hrpc/component/text.dart';
import 'package:flutter/material.dart';

Widget primaryButton({
  required String val,
  required void Function()? onTap,
}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: colorCmp.blackColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: text(
          val: val,
          color: colorCmp.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ));
}
