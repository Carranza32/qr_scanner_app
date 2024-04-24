import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/src/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ProductFormController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  final SpeechToText _speech = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();

  var product = ProductModel().obs;
  var isLoading = false.obs;
  var isListening = false.obs;
  var isSpeaking = false.obs;
  
  var selectedImagePath = "".obs;
  File? file;

  void listen() async {
    if (!_speech.isListening) {
      bool available = await _speech.initialize(
        onError: (errorNotification) {
          stopListening();
          Get.rawSnackbar(
            message: errorNotification.errorMsg,
            duration: const Duration(seconds: 3),
          );
        },
      );

      if (available) {
        _speech.listen(
          localeId: Get.deviceLocale.toString(),
          onResult: (result) {
            descriptionController.text = result.recognizedWords;
          },
        );
        isListening.value = true;
      }
    } else {
      _speech.stop();
      isListening.value = false;
    }
  }

  void stopListening() {
    _speech.stop();
    isListening.value = false;
  }

  void toggleListening() {
    if (isListening.value) {
      stopListening();
    } else {
      listen();
    }
  }

  void speak() async {
    isSpeaking.value = true;
    await _flutterTts.setLanguage("es-ES");
    await _flutterTts.setVolume(5);
    await _flutterTts.setPitch(1);
    await _flutterTts.speak(descriptionController.text).whenComplete(() {
      isSpeaking.value = false;
    });
  }

  void stopSpeaking() async {
    await _flutterTts.stop();
    isSpeaking.value = false;
  }

  void toggleSpeaking() {
    if (isSpeaking.value) {
      stopSpeaking();
    } else {
      speak();
    }
  }

  void saveProduct() async {
    if (formState.currentState!.validate()) {
      isLoading.value = true;
      product.update((val) {
        val!.description = descriptionController.text;
        val.image = selectedImagePath.value;
      });

      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
      Get.back();
    }
  }

  void selectImage(){
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Cámara"),
                onTap: () {
                  _getImage(ImageSource.camera);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Galería"),
                onTap: () {
                  _getImage(ImageSource.gallery);
                  Get.back();
                },
              ),
            ],
          ),
        );
      }
    );
  }

  void _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      file = File(pickedFile.path);
      
      Get.back();
    }else{
      Get.rawSnackbar(message: "Ninguna imagen seleccionada".tr);
    }
  }
}