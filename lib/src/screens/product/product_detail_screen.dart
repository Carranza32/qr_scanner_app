import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_app/src/controllers/ProductDetailController.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  MobileScannerController cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  ProductDetailController controller = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Escanear producto'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state) {
                    case TorchState.off:
                      return Icon(Icons.flash_off, color: Theme.of(context).colorScheme.primaryContainer);
                    case TorchState.on:
                      return Icon(Icons.flash_on, color: Theme.of(context).colorScheme.primary);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state) {
                    case CameraFacing.front:
                      return Icon(Icons.camera_front, color: Theme.of(context).colorScheme.primary);
                    case CameraFacing.back:
                      return Icon(Icons.camera_rear, color: Theme.of(context).colorScheme.primary);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: Get.height * 0.5,
              width: Get.width * 1,
              child: Stack(
                children: [
                  MobileScanner(
                    fit: BoxFit.cover,
                    controller: cameraController,
                    onDetect: (capture) => controller.onDetect(capture.barcodes),
                  ),
                  QRScannerOverlay(
                    borderColor: Colors.red,
                    borderRadius: 16,
                    overlayColor: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.asset('assets/product.png')
                    ),
                    title: Text(controller.selectedProduct.value.barcode!, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                  ),

                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Contador", style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 10),

                        Obx(() => FilledButton.tonal(
                          child: Text(controller.counter.value.toString(), style: Theme.of(context).textTheme.titleMedium),
                          onPressed: () => {},
                        ))
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          icon: const Icon(Icons.save),
                          label: const Text('Guardar'),
                          onPressed: () => controller.saveCounter(),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15))
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      Expanded(
                        child: FilledButton.tonalIcon(
                          icon: const Icon(Icons.delete),
                          label: const Text('Reiniciar'),
                          onPressed: () => controller.resetCounter(),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15))
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        )
    );
  }
}