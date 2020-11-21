import 'package:flutter/material.dart';
import 'package:image_analyzer/colors.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:image_analyzer/info.dart';
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
                floating: false,
                pinned: false,
                collapsedHeight: MediaQuery.of(context).size.height*0.40,
                expandedHeight: MediaQuery.of(context).size.height*0.8,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      color: graphite,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          model.elements[index].keys.first,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          model.elements[index].values.first.toStringAsFixed(2) + '%',
                          style: TextStyle(
                            fontSize: 25,
                            color: getColor(model.elements[index].values.first),
                          ),
                        ),
                      ],
                    ),
                  ),
                  childCount: model.elements.length,
                ),
              ),
            ],
          ),
        ),
      );}
    );
  }

  Color getColor(double index){
    if (index >= 90){
      return Color(0xFF00FF00);
    }else if (index >= 80){
      return Color(0xFF66FF00);
    }else if (index >= 70){
      return Color(0xFF99FF00);
    }else if (index >= 60){
      return Color(0xFFCCFF00);
    }else if (index >= 50){
      return Color(0xFFFFFF00);
    }else if (index >= 40){
      return Color(0xFFFFCC00);
    }else if (index >= 30){
      return Color(0xFFFF9900);
    }else if (index >= 20){
      return Color(0xFFFF6600);
    }else if (index >= 10){
      return Color(0xFFFF3300);
    }else{
      return Color(0xFFFF0000);
    }
  }
}