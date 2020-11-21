import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:image_analyzer/colors.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:provider/provider.dart';

import 'info.dart';

class OutputPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<ImageModel>(context, listen: false).loadData();
    return Consumer<ImageModel>(
      builder: (context, model, child) => FutureBuilder(
        future: model.elements,
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, double>>> snapshot){
          if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError){
            List<Map<String, double>> data = snapshot.data;
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
                              MaterialPageRoute(builder: (context) =>Info()),
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
                                  color: getColor(data[index].values.first),
                                ),
                              ),
                            ],
                          ),
                        ),
                        childCount: data.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState != ConnectionState.done){
            return Stack(
              overflow: Overflow.visible,
              children: [
                Center(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.file(model.image)
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            );
          }else {
            return Stack(
              overflow: Overflow.visible,
              children: [
                Center(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.file(model.image)
                  ),
                ),
                Center(
                  child: AlertDialog(
                    // ignore: unrelated_type_equality_checks
                    title: DataConnectionChecker().hasConnection == true ?
                      Text('Something has gone wrong')  :
                      Text('There is no Internet connection'),
                    actions: [
                      FlatButton(
                        onPressed: () => model.reloadData(),
                        child: Text('Retry')
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Return')
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }
      ),
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
