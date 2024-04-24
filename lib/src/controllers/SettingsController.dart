import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final _storage = GetStorage();
  final selectedThemeSeed = Rx<Color> (Colors.blue);

  final themeColorSeeds = [
    {
      'name': 'Azul',
      'color': const Color.fromRGBO(0, 67, 208, 1),
    },
    {
      'name': 'Amarillo',
      'color': const Color.fromRGBO(255, 196, 0, 1),
    },
    {
      'name': 'Verde',
      'color': const Color.fromRGBO(0, 200, 83, 1),
    },
    {
      'name': 'Rojo',
      'color': const Color.fromRGBO(255, 0, 0, 1),
    }
  ];

  @override
  void onInit() {
    super.onInit();
    if (_storage.read('colorSeed') == null) {
      final colorSeed = themeColorSeeds[0]['color'] as Color;
      changeColor(colorSeed);
    }else{
      final color = getColorFromStorage();
      changeColor(color);
    }
  }

  void changeColor(Color color) {
    selectedThemeSeed.value = color;
    _storage.write('colorSeed', color.toString());
    update();
  }

  Color getColorFromStorage() {
    final colorString = _storage.read('colorSeed') as String;
    if (colorString.startsWith('Color')) {
      final hexColor = colorString.split('(0x')[1].split(')')[0]; // Extraer el valor hexadecimal
      return Color(int.parse(hexColor, radix: 16)); // Convertir el valor hexadecimal a entero y crear un objeto Color
    } else {
      // Si el formato no es Color(0x...), simplemente parseamos el valor entero
      return Color(int.parse(colorString));
    }
  }
}