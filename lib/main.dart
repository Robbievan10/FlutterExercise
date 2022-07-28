import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'dependency_injection/injector.dart';
import 'src/config/routes.dart';
import 'src/data/models/product.dart';
import 'src/presentation/views/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await _initializeDB();
  runApp(const Application());
}

Future<void> _initializeDB() async {
  try {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDir.path)
      ..registerAdapter(ProductAdapter());
  } catch (e) {
    rethrow;
  }
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jorge Gutierrez Exercise',
      routes: Routes.applicationRoutes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      home: const HomePage(),
    );
  }
}
