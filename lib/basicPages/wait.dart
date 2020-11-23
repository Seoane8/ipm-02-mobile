import 'package:flutter/material.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:image_analyzer/utils/colors.dart';
import 'package:provider/provider.dart';

class WaitPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageModel>(
      builder: (context, model, child) => Stack(
        overflow: Overflow.visible,
        children: [
          Center(
            child: Opacity(
              opacity: 0.3,
              child: Image.file(model.image)
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(white),
                  ),
                ),
                SizedBox(height: 30),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.button.copyWith(
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}