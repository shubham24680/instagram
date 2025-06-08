import 'package:flutter/material.dart';
import 'package:instagram/core/widgets/icons.dart';
import 'package:instagram/core/widgets/text.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        CustomIcons(image: image),
        SizedBox(width: 3),
        CustomText(text: text),
      ],
    );
  }
}
