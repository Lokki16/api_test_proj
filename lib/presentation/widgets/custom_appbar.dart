import 'package:api_test_proj/data/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  final bool settings;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.back,
    required this.settings,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: _buildLeading(),
      actions: _buildActions(),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);

  Widget? _buildLeading() {
    if (back) {
      return IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.chevron_left_outlined),
      );
    }
    return null;
  }

  List<Widget>? _buildActions() {
    return [
      if (settings)
        IconButton(
          onPressed: () => Get.toNamed(AppRoutes.routeToChangePasswordPage),
          icon: const Icon(Icons.settings),
        ),
    ];
  }
}
