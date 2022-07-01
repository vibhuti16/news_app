import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomText(String msg,
    {TextStyle? style,
      TextAlign textAlign = TextAlign.justify,
      overflow = TextOverflow.clip,
      BuildContext? context}) {
  if (msg == null) {
    return SizedBox(
      height: 0,
      width: 0,
    );
  } else {
    if (context != null && style != null) {
      var fontSize =
          style.fontSize ?? Theme.of(context).textTheme.bodyText1?.fontSize;
      style = style.copyWith(
          fontSize: fontSize! - (MediaQuery.of(context).size.width <= 375 ? 2 : 0));
    }
    return Text(
      msg,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}