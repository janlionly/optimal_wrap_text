import 'package:flutter/material.dart';

import 'optimal_wrap_text_for_width.dart';

/// A widget that wraps text optimally.
class OptimalWrapText extends StatelessWidget {
  /// Provide the width for edge cases where LayoutBuilder cannot be used.
  /// Such as inside SliverFillRemaining
  final double? width;

  /// See equivalent property in [Text]
  final String text;

  /// See equivalent property in [Text]
  final TextStyle? style;

  /// See equivalent property in [Text]
  final StrutStyle? strutStyle;

  /// See equivalent property in [Text]
  final TextAlign? textAlign;

  /// See equivalent property in [Text]
  final TextDirection? textDirection;

  /// See equivalent property in [Text]
  final Locale? locale;

  /// See equivalent property in [Text]
  final bool? softWrap;

  /// See equivalent property in [Text]
  final double? textScaleFactor;

  /// See equivalent property in [Text]
  final String? semanticsLabel;

  /// See equivalent property in [Text]
  final TextWidthBasis? textWidthBasis;

  /// See equivalent property in [Text]
  final TextHeightBehavior? textHeightBehavior;

  /// See equivalent property in [Text]
  final Color? selectionColor;

  /// Creates a widget that wraps text optimally.
  const OptimalWrapText(
    this.text, {
    super.key,
    this.width,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return OptimalWrapTextForWidth(
        text,
        width: width!,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        textScaleFactor: textScaleFactor,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return OptimalWrapTextForWidth(
          text,
          width: constraints.maxWidth,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          textScaleFactor: textScaleFactor,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        );
      },
    );
  }
}
