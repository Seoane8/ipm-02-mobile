
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:image_analyzer/output.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SelectImageButton extends StatelessWidget{
  final String text;
  final IconData icon;
  final ImageSource source;
  SelectImageButton(this.text, this.icon, this.source): super();

  Widget build(BuildContext context) {

    return OutlinedButton.icon(
      onPressed: () => getImage(context, source),
      icon: Icon(icon),
      label: Text(text),
    );
  }

  Future getImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    Provider.of<ImageModel>(context, listen: false).
    setImage(File(pickedFile.path));

    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) {
              return OutputPage();
            }
        ));
  }

}