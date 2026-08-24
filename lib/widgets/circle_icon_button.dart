import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final double size;
  final double iconSize;

  const CircleIconButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.size = 38,
    this.iconSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF3D3B8E).withValues(alpha: 0.1),
        ),
        child: Center(
          child: SvgPicture.asset(iconPath, width: iconSize, height: iconSize),
        ),
      ),
    );
  }
}
