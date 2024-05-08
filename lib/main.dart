import 'package:err_rss_reader/app/app.dart';
import 'package:err_rss_reader/core/services/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}
