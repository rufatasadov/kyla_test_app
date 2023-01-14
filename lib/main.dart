import 'package:flutter/material.dart';
import 'package:kyle_test_app/provider/my_bag_provider.dart';
import 'package:kyle_test_app/ui/home/home_page.dart';
import 'package:kyle_test_app/ui/my_bag/my_bag.dart';
import 'package:kyle_test_app/ui/product_detail.dart';
import 'package:kyle_test_app/ui/transition.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyBagProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kyla test app',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
            actionsIconTheme: IconThemeData(color: Colors.black)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
