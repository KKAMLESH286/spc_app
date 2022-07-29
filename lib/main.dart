import 'package:flutter/material.dart';
import 'package:icm_app/injector.dart';
import 'package:icm_app/presentation/dashboard/dashboard.dart';
import 'package:icm_app/presentation/details/details_screen.dart';

import 'presentation/home/tab_bar.dart';
import 'res/style.dart';

void main() {
  runApp(
    Injector(router: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indian City Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          displayLarge: kDisplaySmall,
          displayMedium: kDisplayMedium,
          displaySmall: kDisplaySmall,
          headlineLarge: kHeadlineLarge,
          headlineMedium: kHeadlineMedium,
          headlineSmall: kHeadlineSmall,
          titleLarge: kTitleLarge,
          titleMedium: kTitleMedium,
          titleSmall: kTitleSmall,
          bodyLarge: kBodyLarge,
          bodyMedium: kBodyMedium,
          bodySmall: kBodySmall,
          labelLarge: kLabelLarge,
          labelMedium: kBodyMedium,
          labelSmall: kBodySmall,
        ),
      ),
      home: TabBarCustom(),
      routes: {
        DetailsScreen.routeName: (context) => DetailsScreen(),
      },
    );
  }
}
