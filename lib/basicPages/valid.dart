import 'package:flutter/material.dart';
import 'package:image_analyzer/widgets/elementsList.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:image_analyzer/widgets/infoIcon.dart';
import 'package:provider/provider.dart';

class ValidPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Center(child: Text('Analyze')),
                actions: [InfoIcon()],
                flexibleSpace: Center(
                  child: Image.file(model.image),
                ),
                collapsedHeight: MediaQuery.of(context).size.height*0.40,
                expandedHeight: MediaQuery.of(context).size.height*0.8,
              ),
              (MediaQuery.of(context).size.shortestSide > 600) ?
              SliverGrid(
                delegate: ElementsList.get(
                    context,
                    model.elements
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 7,
                ),
              ):
              SliverList(
                delegate: ElementsList.get(
                  context,
                  model.elements
                )
              )
            ],
          ),
        );
      }
    );
  }
}