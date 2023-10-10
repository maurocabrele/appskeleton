import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './navigator.dart' as navigator;
import 'injection/provider.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Skeleton App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        onGenerateRoute: (RouteSettings settings) {
          navigator.settings = settings;
          var routes = navigator.routes;
          final WidgetBuilder? builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder!(ctx));
        });
  }
}
