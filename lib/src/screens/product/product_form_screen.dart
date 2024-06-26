import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/ProductFormController.dart';
import '../../controllers/ProductListController.dart';
import '../../models/product_model.dart';

class ProductFormScreen extends StatelessWidget {
  final controller = Get.put(ProductFormController());
  final productListController = Get.find<ProductListController>();

  ProductFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Producto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formState,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: formFieldStyle().copyWith(
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese un nombre';
                  }
                  return null;
                },
                controller: controller.nameController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: formFieldStyle().copyWith(
                  labelText: 'Código de barras',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese un código de barras';
                  }
                  return null;
                },
                controller: controller.barcodeController,
              ),
              // const SizedBox(height: 20),

              // Card(
              //   elevation: 0,
              //   color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              //     child: Obx(() {
              //       if (controller.selectedImagePath.value.isEmpty) {
              //         return IconButton(
              //           icon: const Icon(Icons.add_a_photo_rounded),
              //           onPressed: controller.selectImage,
              //         );
              //       } else {
              //         return Image.file(
              //           controller.file!,
              //           fit: BoxFit.cover,
              //         );
              //       }
              //     }),
              //   ),
              // ),

              const SizedBox(height: 20),
              TextFormField(
                controller: controller.descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 5,
                decoration: formFieldStyle().copyWith(
                  labelText: 'Descripción',
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Obx(() => controller.isListening.value

                  ? IconButton.filled(
                      icon: const Icon(Icons.stop),
                      onPressed: () => controller.toggleListening(),
                    )
                  : IconButton.filledTonal(
                      icon: const Icon(Icons.mic_none_rounded),
                      onPressed: () => controller.toggleListening(),
                    )),

                  const SizedBox(width: 10),

                  // Obx(() => controller.isSpeaking.value

                  // ? IconButton.filled(
                  //     icon: const Icon(Icons.stop),
                  //     onPressed: () => controller.toggleSpeaking(),
                  //   )
                  // : IconButton.filledTonal(
                  //     icon: const Icon(Icons.volume_up_rounded),
                  //     onPressed: () => controller.toggleSpeaking(),
                  //   )),
                ],
              ),
              const SizedBox(height: 100),
              FilledButton(
                onPressed: () async {
                  if (controller.formState.currentState!.validate()) {
                    ProductModel? exist = productListController.products.firstWhereOrNull(
                      (element) => element.barcode == controller.barcodeController.text
                    );

                    if (exist != null) {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: 'Error',
                          message: 'El producto ya existe',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    Get.showSnackbar(
                      const GetSnackBar(
                        title: 'Guardando producto',
                        message: 'Por favor, espere...',
                        showProgressIndicator: true,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    productListController.products.add(
                      ProductModel(
                        name: controller.nameController.text,
                        barcode: controller.barcodeController.text,
                        description: controller.descriptionController.text,
                        image: controller.selectedImagePath.value,
                      ),
                    );

                    controller.clearForm();

                    Navigator.pop(context);
                  }
                },
                style: FilledButton.styleFrom(
                  elevation: 3,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Guardar'),
              ),
            ],
          ),
        )
      ),
    );
  }
}