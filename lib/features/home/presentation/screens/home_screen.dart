import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa/core/theme/app_colors.dart';
import 'package:ousa/features/home/presentation/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Obx(
          () => Text(
            'Count: ${controller.count.value}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.count.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
