import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.h), // Set this height
          child: const AppBarWidget(
            title: 'Setting',
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0x0fffffff),
          child: Column(
            children: const [],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 3,
        ));
  }
}
