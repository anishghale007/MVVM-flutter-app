import 'package:flutter/material.dart';
import 'package:flutter_udemy/app/app.dart';
import 'package:flutter_udemy/app/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();    // registering the dependency injection
  runApp(MyApp());
}

