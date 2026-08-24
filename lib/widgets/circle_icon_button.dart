import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/constant/app_color.dart';

class CircleIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final bool matchTextDirection;

  const CircleIconButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.size = 38,
    this.iconSize = 22,
    this.matchTextDirection = false,
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
          color: AppColors.iconBackground,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
            matchTextDirection: matchTextDirection,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
