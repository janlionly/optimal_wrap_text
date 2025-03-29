import 'package:flutter/rendering.dart';

extension TextAlignToAlignment on TextAlign {
  Alignment toAlignment(TextDirection direction) {
    switch (this) {
      case TextAlign.left:
        return Alignment.centerLeft;
      case TextAlign.right:
        return Alignment.centerRight;
      case TextAlign.center:
        return Alignment.center;
      case TextAlign.justify:
      case TextAlign.start:
        return direction == TextDirection.rtl
            ? Alignment.centerRight
            : Alignment.centerLeft;
      case TextAlign.end:
        return direction == TextDirection.rtl
            ? Alignment.centerLeft
            : Alignment.centerRight;
    }
  }
}
