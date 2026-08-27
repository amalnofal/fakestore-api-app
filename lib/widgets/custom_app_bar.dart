import 'package:flutter/material.dart';
import 'package:store_app/widgets/circle_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CircleIconButton(
          iconPath: 'assets/icons/back_icon.svg',
          matchTextDirection: true,
          onTap: () => Navigator.pop(context),
        ),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}