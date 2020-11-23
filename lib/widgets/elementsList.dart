import 'package:flutter/material.dart';

class ElementsList{

  static SliverChildBuilderDelegate get(BuildContext context, List data) {
    return  SliverChildBuilderDelegate(
      (BuildContext context, int index) => Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Theme.of(context).accentColor),
        ),
        child: ListTile(
          title: Text(data[index].keys.first),
          trailing: _getPercentage(data[index].values.first),
        ),
      ),
      childCount: data.length,
    );
  }

  static Widget _getPercentage(double index){
    Color color;
    if (index >= 90){
      color = Color(0xFF00FF00);
    }else if (index >= 80){
      color = Color(0xFF66FF00);
    }else if (index >= 70){
      color = Color(0xFF99FF00);
    }else if (index >= 60){
      color = Color(0xFFCCFF00);
    }else if (index >= 50){
      color = Color(0xFFFFFF00);
    }else if (index >= 40){
      color = Color(0xFFFFCC00);
    }else if (index >= 30){
      color = Color(0xFFFF9900);
    }else if (index >= 20){
      color = Color(0xFFFF6600);
    }else if (index >= 10){
      color = Color(0xFFFF3300);
    }else{
      color = Color(0xFFFF0000);
    }

    return Text(
      index.toStringAsFixed(2) + '%',
      style: TextStyle(
        color: color,
        fontSize: 25,
      ),
    );
  }

}