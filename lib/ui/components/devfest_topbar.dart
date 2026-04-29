import 'package:flutter/material.dart';

class DevFestTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackClick;
  final List<Widget>? actions;

  const DevFestTopBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackClick,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: showBackButton
          ? IconButton(
              onPressed: onBackClick ?? () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              tooltip: "Voltar",
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}