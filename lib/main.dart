import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton_2024_mv/app/main_app.dart';
import 'package:hackaton_2024_mv/navigation/router.dart';

void main() {
  final container = ProviderContainer();
  runApp(
    ProviderScope(
      parent: container,
      child: const MainApp(),
    ),
  );
}
