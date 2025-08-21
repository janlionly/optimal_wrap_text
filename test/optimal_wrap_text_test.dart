import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:optimal_wrap_text/optimal_wrap_text.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final fontData = File('test/assets/roboto-regular.ttf').readAsBytesSync();
    final fontLoader = FontLoader('Roboto')
      ..addFont(Future.value(fontData.buffer.asByteData()));
    await fontLoader.load();
  });

  const text = 'My slightly longer text that will span 2 or 3 lines';
  const surfaceSize = Size(200, 300);

  testWidgets('Left', (tester) async {
    await tester.binding.setSurfaceSize(surfaceSize);

    await tester.pumpWidget(
      Wrapper(
        text: text,
        style: TextStyle(color: Colors.blue),
        textAlign: TextAlign.left,
      ),
    );

    await expectLater(
      find.byType(Wrapper),
      matchesGoldenFile('goldens/comparison_left.png'),
    );
  });

  testWidgets('Left', (tester) async {
    await tester.binding.setSurfaceSize(surfaceSize);

    await tester.pumpWidget(
      Wrapper(
        text: text,
        style: TextStyle(color: Colors.blue),
        textAlign: TextAlign.right,
      ),
    );

    await expectLater(
      find.byType(Wrapper),
      matchesGoldenFile('goldens/comparison_right.png'),
    );
  });

  testWidgets('Center', (tester) async {
    await tester.binding.setSurfaceSize(surfaceSize);

    await tester.pumpWidget(
      Wrapper(
        text: text,
        style: TextStyle(color: Colors.blue),
        textAlign: TextAlign.center,
      ),
    );

    await expectLater(
      find.byType(Wrapper),
      matchesGoldenFile('goldens/comparison_center.png'),
    );
  });

  testWidgets('Start RTL', (tester) async {
    await tester.binding.setSurfaceSize(surfaceSize);

    await tester.pumpWidget(
      Wrapper(
        text: text,
        style: TextStyle(color: Colors.blue),
        textAlign: TextAlign.start,
        textDirection: TextDirection.rtl,
      ),
    );

    await expectLater(
      find.byType(Wrapper),
      matchesGoldenFile('goldens/comparison_start_rtl.png'),
    );
  });

  testWidgets('End RTL', (tester) async {
    await tester.binding.setSurfaceSize(surfaceSize);

    await tester.pumpWidget(
      Wrapper(
        text: text,
        style: TextStyle(color: Colors.blue),
        textAlign: TextAlign.end,
        textDirection: TextDirection.rtl,
      ),
    );

    await expectLater(
      find.byType(Wrapper),
      matchesGoldenFile('goldens/comparison_end_rtl.png'),
    );
  });
}

class Wrapper extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;

  const Wrapper({
    super.key,
    required this.text,
    required this.style,
    required this.textAlign,
    this.textDirection = TextDirection.ltr,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: DefaultTextHeightBehavior(
        textHeightBehavior: TextHeightBehavior(),
        child: DefaultTextStyle(
          style: TextStyle(fontFamily: 'Roboto', fontSize: 16),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: style, textAlign: textAlign),
                  SizedBox(height: 16),
                  OptimalWrapText(text, style: style, textAlign: textAlign),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
