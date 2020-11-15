import 'package:flutter/material.dart';

import 'package:image_analyzer/colors.dart';
import 'package:image_analyzer/home.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: grafito,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
              ),
              title: Center(child: Text('Analyze')),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.info_outlined,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
              ],
              flexibleSpace: Center(
                child: FlutterLogo(size: 200),
              ),
              floating: true,
              pinned: true,
              collapsedHeight: MediaQuery.of(context).size.height*0.40,
              expandedHeight: MediaQuery.of(context).size.height*0.80,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    color: grafito,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Elemento',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$index',
                        style: TextStyle(
                          fontSize: 25,
                          color: getColor(index),
                        ),
                      ),
                    ],
                  ),
                ),
                childCount: 10,
              ),
            )
          ],
        ),
      )
    );
  }

  Color getColor(int index){
    index = index*10;
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
