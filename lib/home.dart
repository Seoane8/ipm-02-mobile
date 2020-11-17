import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_analyzer/colors.dart';
import 'package:image_analyzer/info.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grafito,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Image Analyzer"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outlined,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,

          children: <Widget> [
            imageButton(
              () => getImage(context, ImageSource.camera),
              'Abrir Cámara',
              Icons.camera_outlined
            ),
            SizedBox(height: 60),
            imageButton(
              () => getImage(context, ImageSource.gallery),
              'Seleccionar Imagen',
              Icons.insert_photo_outlined
            ),
          ],
        ),
      ),
    );
  }

  Widget imageButton(VoidCallback function, String text, IconData icon){
    return OutlinedButton.icon(
      onPressed: function,
      icon: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
        ),
        padding: MaterialStateProperty.all(
            EdgeInsets.fromLTRB(30, 15, 30, 15)
        ),
        side: MaterialStateProperty.all(
            BorderSide(width: 2, color: Colors.white)
        ),
      ),
    );
  }

  Future getImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    File image = File(pickedFile.path);
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return InfoPage(image: image);
        }
      ));
  }


}