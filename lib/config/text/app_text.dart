import 'package:flutter/widgets.dart';

Text appText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  TextAlign? textAlign,
}) {
  return Text(text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: TextOverflow.ellipsis
      ));
}
