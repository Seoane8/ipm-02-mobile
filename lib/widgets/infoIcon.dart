import 'package:flutter/material.dart';
import 'package:image_analyzer/basicPages/info.dart';

class InfoIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.info_outlined,
        color: Theme.of(context).accentColor,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Info()),
        );
      }
    );
  }

}