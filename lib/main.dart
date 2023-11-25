import 'dart:async';
import 'package:ai_hack/provider/fun1_provider.dart';
import 'package:ai_hack/provider/fun2_provider.dart';
import 'package:ai_hack/provider/fun3_provider.dart';
import 'package:ai_hack/utils/custom_scroll_behavior.dart';
import 'package:ai_hack/view/fun1_result_screen.dart';
import 'package:ai_hack/view/fun1_screen.dart';
import 'package:ai_hack/view/fun2_result_screen.dart';
import 'package:ai_hack/view/fun2_screen.dart';
import 'package:ai_hack/view/fun3_result_screen.dart';
import 'package:ai_hack/view/fun3_screen.dart';
import 'package:ai_hack/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Fun1Provider()),
    ChangeNotifierProvider(create: (_) => Fun2Provider()),
    ChangeNotifierProvider(create: (_) => Fun3Provider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'AI_HACK@@LOL',
      home: const MainScreen(),
      // routes: {
      //   '/main': (context) => const MainScreen(),
      //   'fun1': (context) => const Fun1Screen(),
      //   '/fun2': (context) => const Fun2Screen(),
      //   '/fun3': (context) => const Fun3Screen(),
      //   '/fun1-result': (context) => const Fun1ResultScreen(),
      //   '/fun2-result': (context) => const Fun2ResultScreen(),
      //   '/fun3-result': (context) => const Fun3ResultScreen(),
      // },
    );
  }
}
