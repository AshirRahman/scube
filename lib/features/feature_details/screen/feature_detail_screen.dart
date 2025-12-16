import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/widgets/custom_appbar.dart';
import 'package:scube/core/utils/constants/image_path.dart';
import '../../dashboard/model/dashboard_feature_model.dart';

class FeatureDetailScreen extends StatelessWidget {
  final DashboardFeatureModel? feature;

  const FeatureDetailScreen({super.key, this.feature});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeaf4ff),
      appBar: CustomAppBar(
        title: feature?.title ?? '',
        showBack: true,
        onBack: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImagePath.noData,
                  width: 359,
                  height: 259,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
