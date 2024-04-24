import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/controllers/SettingsController.dart';
import 'src/utils/routes/router.dart';

main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      title: 'Scanner App',
      debugShowCheckedModeBanner: false,
      getPages: Routes.route,
			initialRoute: '/tabs',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorSchemeSeed: settingsController.selectedThemeSeed.value,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 9, 9, 9),
        useMaterial3: true,
      )
    ));
  }
}