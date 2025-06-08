import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/core/utils/colors.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({super.key, required this.image, this.width, this.color});

  final String image;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: width ?? 20,
      colorFilter: ColorFilter.mode(
        color ?? black,
        BlendMode.srcIn,
      ),
    );
  }
}
