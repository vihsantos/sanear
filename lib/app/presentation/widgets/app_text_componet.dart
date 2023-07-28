import 'package:flutter/material.dart';
import 'package:sanear/app/presentation/utils/color_palette.dart';

class AppTextComponent extends StatelessWidget {
  final FontWeight isBold;
  final Color color;
  final double size;
  final String text;
  final int maxLines;
  final bool overflow;
  final bool alignCenter;

  const AppTextComponent({
    Key? key,
    this.isBold = FontWeight.normal,
    this.color = ColorPalette.blackColor,
    required this.size,
    required this.text,
    this.maxLines = 0,
    this.overflow = false,
    this.alignCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignCenter == true ? TextAlign.center : null,
      maxLines: maxLines == 0 ? null : maxLines,
      // overflow: overflow == true ? TextOverflow.ellipsis : null,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold,
      ),
    );
  }
}
