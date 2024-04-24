import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/TabController.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<TabsController>(
      builder: (controller) => NavigationBar(
        selectedIndex: controller.currentIndex,
				onDestinationSelected: (i) => controller.setCurrentIndex(i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.view_list),
            label: 'Productos',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
      ),
    );
  }
}