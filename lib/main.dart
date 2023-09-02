import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cat_fact_app.dart';
import 'model/favorite_fact/favorite_fact.dart';
import 'infrastructure/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteFactAdapter());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFFA30000),
    systemNavigationBarColor: Color(0xFFA30000),
  ));
  runApp(const CatFactApp());
}
