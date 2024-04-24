import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/src/screens/settings/settings_screen.dart';

import '../../controllers/TabController.dart';
import '../../widgets/navigation_widget.dart';
import '../index.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: const NavigationWidget(),
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabsController tabController = Get.put(TabsController());

    return PageView(
      controller: tabController.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ProductListScreen(),
        SettingsScreen(),
      ],
    );
  }
}