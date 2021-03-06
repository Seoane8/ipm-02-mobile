import 'package:flutter/material.dart';
import 'package:image_analyzer/basicPages/error.dart';
import 'package:image_analyzer/landscapePages/validLandscape.dart';
import 'package:image_analyzer/basicPages/wait.dart';
import 'package:image_analyzer/basicPages/valid.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:provider/provider.dart';


class OutputPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<ImageModel>(context, listen: false).loadData();
    return Consumer<ImageModel>(
      builder: (context, model, child) {
        if (model.error){
          return ErrorPage();
        } else if (model.elements == null){
          return WaitPage();
        }else {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return constraints.smallest.longestSide > 600 &&
                    MediaQuery.of(context).orientation == Orientation.landscape
                ? ValidLandscapePage()
                : ValidPage();
              }
          );
        }
      },
    );
  }
}
