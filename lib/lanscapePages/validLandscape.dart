import 'package:flutter/material.dart';
import 'package:image_analyzer/utils/colors.dart';
import 'package:image_analyzer/widgets/elementsList.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:image_analyzer/basicPages/info.dart';
import 'package:provider/provider.dart';

class ValidLandscapePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: graphite,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Center(child:Text("Analyze")),
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
                    );
                  }
                )
              ],
            ),
            body: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child:
                  Image.file(model.image)
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: ListView.custom(
                    childrenDelegate: ElementsList.get(context, model.elements),
                  ),
                ),
              ]
            ),
          );
        }
    );
  }
}