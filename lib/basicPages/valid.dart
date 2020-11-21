import 'package:flutter/material.dart';
import 'package:image_analyzer/utils/colors.dart';
import 'package:image_analyzer/widgets/elementsList.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:image_analyzer/basicPages/info.dart';
import 'package:provider/provider.dart';

class ValidPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageModel>(
      builder: (context, model, child) {
        return Scaffold(
        body: Container(
          color: graphite,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Center(child: Text('Analyze')),
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
                  ),
                ],
                flexibleSpace: Center(
                  child: Image.file(model.image),
                ),
                collapsedHeight: MediaQuery.of(context).size.height*0.40,
                expandedHeight: MediaQuery.of(context).size.height*0.8,
              ),
              SliverList(
                delegate: ElementsList.get(
                  context,
                  model.elements
                )
              ),
            ],
          ),
        ),
      );}
    );
  }
}