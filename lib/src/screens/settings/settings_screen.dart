import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/src/controllers/SettingsController.dart';

class SettingsScreen extends StatelessWidget {
	SettingsScreen({super.key});

  final SettingsController settingsController = Get.put(SettingsController());

	@override
	Widget build(BuildContext context) {
		return SafeArea(
			child: Scaffold(
				appBar: AppBar(
					title: const Text('Ajustes'),
				),
				body: ListView(
					padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
					children: [
						Card.filled(
              child: ObxValue((data) => 
              SwitchListTile.adaptive(
                title: const Text('Modo oscuro'),
                value: data.value,
                onChanged: (value) {
                  Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
                  data.value = value;
                },
              )
              , false.obs  ),
            ),

            Card.filled(
              child: ListTile(
                title: const Text("Color principal"),
                trailing: Obx(() => PopupMenuButton(
                    icon: const Icon(Icons.color_lens),
                    iconColor: settingsController.selectedThemeSeed.value,
                    itemBuilder: (context) {
                      return settingsController.themeColorSeeds.map((colorSeed) => PopupMenuItem(
                        value: colorSeed['color'] as Color,
                        child: Text(colorSeed['name'] as String),
                      )).toList();
                    },
                    onSelected: (color) {
                      settingsController.changeColor(color);
                    },
                  )),
              )
            ),
					],
				)
			),
		);
	}
}