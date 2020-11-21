import 'package:flutter/material.dart';
import 'package:image_analyzer/utils/colors.dart';

class ElementsList{

  static SliverChildBuilderDelegate get(BuildContext context, List data) {
    return  SliverChildBuilderDelegate(
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
              data[index].keys.first,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Text(
              data[index].values.first.toStringAsFixed(2) + '%',
              style: TextStyle(
                fontSize: 25,
                color: _getColor(data[index].values.first),
              ),
            ),
          ],
        ),
      ),
      childCount: data.length,
    );
  }

  static Color _getColor(double index){
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