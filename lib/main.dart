import 'package:emtrade_test_apps/data/datasource/emtrade_remote_datasources.dart';
import 'package:emtrade_test_apps/presentation/provider/part.dart';
import 'package:emtrade_test_apps/routes/routes_generate.dart';
import 'package:emtrade_test_apps/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => GetHomeProvider(EmtradeRemoteDataSource())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RoutesName.homeScreen,
      ),
    );
  }
}
