import 'package:fake_store/app/module/app_module.dart';
import 'package:fake_store/app/presentation/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: ModularApp(module: AppModule(), child: AppWidget()),
    ),
  );
}
