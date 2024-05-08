import 'package:err_rss_reader/core/resources/app_strings.dart';
import 'package:err_rss_reader/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';

class HomeFeedScreen extends StatelessWidget {
  const HomeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.errEE),
        centerTitle: true,
        backgroundColor: AppColors.bgLight,
        scrolledUnderElevation: 0,
      ),
      body: Container(),
    );
  }
}
