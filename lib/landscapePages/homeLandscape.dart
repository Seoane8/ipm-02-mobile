import 'package:flutter/material.dart';
import 'package:image_analyzer/widgets/infoIcon.dart';
import 'package:image_analyzer/widgets/selectImageButton.dart';
import 'package:image_picker/image_picker.dart';

class HomeLandscapePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Image Analyzer"),
        actions: [InfoIcon()],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,

          children: <Widget> [
            SelectImageButton(
                'Open Camera',
                Icons.camera_outlined,
                ImageSource.camera
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.1),
            SelectImageButton(
                'Select from Gallery',
                Icons.insert_photo_outlined,
                ImageSource.gallery
            ),
          ],
        ),
      ),
    );
  }

}