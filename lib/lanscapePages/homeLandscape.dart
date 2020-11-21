import 'package:flutter/material.dart';
import 'package:image_analyzer/utils/colors.dart';
import 'package:image_analyzer/basicPages/info.dart';
import 'package:image_analyzer/widgets/selectImageButton.dart';
import 'package:image_picker/image_picker.dart';

class HomeLandscapePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: graphite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Image Analyzer"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.info_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Info()),
                );}
          )
        ],
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