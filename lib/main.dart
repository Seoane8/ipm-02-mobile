import 'package:flutter/material.dart';

import 'package:image_analyzer/basicPages/home.dart';
import 'package:image_analyzer/utils/colors.dart';
import 'package:image_analyzer/lanscapePages/homeLandscape.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImageModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: graphite,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return constraints.smallest.longestSide > 600 &&
              MediaQuery.of(context).orientation == Orientation.landscape
              ? HomeLandscapePage()
              : HomePage();
          }
        )
      ),
    );
  }
}