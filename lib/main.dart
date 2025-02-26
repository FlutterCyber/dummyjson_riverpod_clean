import 'package:dummyjson_riverpod_clean/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await diInit(); // Initialize all dependencies with get_it
  runApp(const ProviderScope(child: MyApp()));
}
