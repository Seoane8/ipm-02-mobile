import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_analyzer/colors.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: graphite,
        appBar: AppBar(

          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Info")),
        body:Text(
          "\n\nCreated by: \n"
              "Diego Seoane González\n"
          "Guillermo Somoza Morales\n\n\n"
              "Powered by: https://imagga.com/\n\n\n"
              "Take a picture with your camera or select it from your gallery"
              " to scan it.",
          textAlign: TextAlign.left,
          textScaleFactor: 1.5,
          style: TextStyle(
              color: Colors.white
          ),
        ),
    );

  }
}