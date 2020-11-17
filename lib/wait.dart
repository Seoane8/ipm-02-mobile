import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_analyzer/colors.dart';

class WaitPage extends StatelessWidget {
  final File image;
  WaitPage({this.image}): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grafito,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.info_outlined,
                color: Colors.white,
              ),
              onPressed: null
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,

          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: [
                 Center(
                  child: Opacity(
                      opacity: 0.3,
                      child: Image.file(
                        image,
                        height: MediaQuery.of(context).size.height*0.8,
                      )
                  ),
                ),
                Positioned(
                  width: 50,
                  height: 50,
                  top: MediaQuery.of(context).size.width/2-25,
                  left: MediaQuery.of(context).size.width/2-25,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}