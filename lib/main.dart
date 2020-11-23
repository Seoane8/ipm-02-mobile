import 'package:flutter/material.dart';

import 'package:image_analyzer/basicPages/home.dart';
import 'package:image_analyzer/landscapePages/homeLandscape.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:image_analyzer/utils/themes.dart';
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
        title: 'Image Analyzer',
        theme: Themes.lightTheme(context),
        darkTheme: Themes.darkTheme(context),
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