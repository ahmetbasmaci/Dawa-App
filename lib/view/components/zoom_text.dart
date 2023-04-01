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
      this.fontSize = 17.0,
      this.color,
      this.fontWeight,
      this.textAlign});

  @override
  _ZoomTextState createState() => _ZoomTextState();
}

class _ZoomTextState extends State<ZoomText> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: MySiezes.nestedTopicPadding),
      child: Transform.scale(
        scale: 1,
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
                  fontSize: widget.fontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
