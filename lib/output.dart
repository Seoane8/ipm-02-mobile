import 'package:flutter/material.dart';
import 'package:image_analyzer/error.dart';
import 'package:image_analyzer/wait.dart';
import 'package:image_analyzer/valid.dart';
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
          return ValidPage();
        }
      },
    );
  }

}
