import 'package:flutter/material.dart';

import '../../config/color_constants.dart';
import '../../config/constant.dart';

class DefText {
  final String text;
  final Color color;
  final double opacity;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Key? key;
  final TextStyle? customStyle;
  final double? lineHeight;

  DefText(
    this.text, {
    this.maxLine,
    this.color = kBgWhite,
    this.opacity = 1,
    this.fontStyle,
    this.fontWeight,
    this.textAlign,
    this.decoration,
    this.key,
    this.customStyle,
    this.lineHeight,
  });

  TextStyle get _style {
    if (customStyle == null) {
      return kDefaultTextStyle.copyWith(
        color: color.withOpacity(opacity),
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        decoration: decoration,
        height: lineHeight,
      );
    } else {
      return customStyle!.copyWith(
        color: color.withOpacity(opacity),
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        decoration: decoration,
      );
    }
  }

  Text get flex {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _style,
    );
  }

  Text get mini {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 8.9),
      style: _style.copyWith(fontSize: kNormalFontSize - 3.8),
    );
  }

  Text get extraSmall {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 9.7),
      style: _style.copyWith(fontSize: kNormalFontSize - 3),
    );
  }

  Text get small {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 10.7),
      style: _style.copyWith(fontSize: kNormalFontSize - 2),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get semiSmall {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 11.7),
      style: _style.copyWith(fontSize: kNormalFontSize - 1),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get normal {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 12.7),
      style: _style.copyWith(fontSize: kNormalFontSize),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get semilarge {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 15.7),
      style: _style.copyWith(fontSize: kNormalFontSize + 3),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get large {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 17.7),
      style: _style.copyWith(fontSize: kNormalFontSize + 5),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get extraLarge {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 22.7),
      style: _style.copyWith(fontSize: kNormalFontSize + 10),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get huge {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 27.7),
      style: _style.copyWith(fontSize: kNormalFontSize + 15),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get extraHuge {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      // style: _style.copyWith(fontSize: 32.7),
      style: _style.copyWith(fontSize: kNormalFontSize + 25),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }
}
