import 'package:flutter/material.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

class BoardingItem extends StatelessWidget {
  const BoardingItem({
    super.key,
    required this.image,
    required this.label,
    required this.text,
  });
  final String image;
  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 197),
        Center(
          child: Image.asset(
            image,
          ),
        ),
        const SizedBox(height: 68),
        Padding(
          padding: kDefaultScaffoldPadding,
          child: DefText(
            label,
            color: kBgWhite,
          ).huge,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: kDefaultScaffoldPadding,
          child: DefText(
            text,
            color: kBgWhite,
          ).semilarge,
        ),
      ],
    );
  }
}
