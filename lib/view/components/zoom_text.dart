import 'package:alda3ia/constents/my_sizes.dart';
import 'package:flutter/material.dart';

class ZoomText extends StatefulWidget {
  final String text;
  double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  ZoomText(
      {required this.text,
      this.fontSize = 16.0,
      this.color,
      this.fontWeight,
      this.textAlign});

  @override
  _ZoomTextState createState() => _ZoomTextState();
}

class _ZoomTextState extends State<ZoomText> {
  double _currentScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    double newFontSize = widget.fontSize * _currentScaleFactor;
    return GestureDetector(
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          _currentScaleFactor = 1 * details.scale;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MySiezes.nestedTopicPadding),
        child: Transform.scale(
                scale: _currentScaleFactor,
                child: InteractiveViewer(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: MySiezes.nestedTopicWidth,
                      child: SelectableText(
                        widget.text,
                        textAlign: widget.textAlign,
                        style: TextStyle(
                          fontWeight: widget.fontWeight,
                          color: widget.color,
                          fontSize: newFontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
