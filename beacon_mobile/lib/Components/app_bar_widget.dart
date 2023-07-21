import 'package:beacon/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {Key? key, this.hasProfileIcon = true, required this.title})
      : super(key: key);

  final String title;
  final bool hasProfileIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.black,
      actions: (hasProfileIcon)
          ? [
              IconButton(
                icon: const Icon(
                  Icons.account_circle_sharp,
                  size: 30,
                ),
                onPressed: () => Get.toNamed(Routes.profileScreen),
              ),
            ]
          : null,
      backgroundColor: const Color(0xFFFFE424),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: "Ubuntu",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
