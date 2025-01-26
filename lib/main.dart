import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawika_machine_test/core/services/shared_pref_helper.dart';
import 'package:kawika_machine_test/presentation/auth/view/login_screen.dart';
import 'package:kawika_machine_test/presentation/home/view/bottom_nav_view.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: sccaffoldMessenagKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}

final navigatorKey = GlobalKey<NavigatorState>();
final sccaffoldMessenagKey = GlobalKey<ScaffoldMessengerState>();

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> checkLogin() async {
    String? userDetails = await SharedPrefHelper.getValue("user");
    if (userDetails != null) {
      navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => BottomNavview(),
        ),
        (route) => false,
      );
    } else {
      navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ),
        (route) => false,
      );
    }
  }
}
