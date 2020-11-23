import 'package:flutter/material.dart';
import 'package:image_analyzer/widgets/elementsList.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:image_analyzer/widgets/infoIcon.dart';
import 'package:provider/provider.dart';

class ValidLandscapePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Analyze"),
              actions: [InfoIcon()],
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
                  child:(MediaQuery.of(context).size.shortestSide > 600) ?
                  GridView.custom(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 5,
                      ),
                      childrenDelegate: ElementsList.get(context, model.elements),
                  ) :
                  ListView.custom(
                    childrenDelegate: ElementsList.get(context, model.elements),
                  )
                ),
              ]
            ),
          );
        }
    );
  }
}