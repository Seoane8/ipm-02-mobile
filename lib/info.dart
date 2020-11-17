import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:image_analyzer/colors.dart';
import 'package:image_analyzer/home.dart';
import 'package:image_analyzer/wait.dart';

class InfoPage extends StatefulWidget {
  final File image;
  InfoPage({this.image}): super();

  @override
  _InfoPageState createState() => _InfoPageState(image);
}

class _InfoPageState extends State<InfoPage> {
  File _image;
  Future<List<Map<String, double>>> _elements;

  _InfoPageState(File image){
    _image = image;
  }

  @override
  void initState(){
    super.initState();
    _elements = _getData(_image);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _elements,
      builder: (BuildContext context, AsyncSnapshot<List<Map<String, double>>> snapshot){
        if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError){
          List<Map<String, double>> data = snapshot.data;
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
                      child: Image.file(_image),
                    ),
                    floating: false,
                    pinned: false,
                    collapsedHeight: MediaQuery.of(context).size.height*0.40,
                    expandedHeight: MediaQuery.of(context).size.height,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => Container(
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
          return WaitPage(image: _image);
        }else {
          return Text('Ha ocurrido un error');
        }
      }
    );
  }

  Future<List<Map<String, double>>> _getData(File image) async {

    http.Response response = await http.post(
      'https://api.imagga.com/v2/tags',
      headers: {HttpHeaders.authorizationHeader:
      "Basic YWNjX2Q4NWI4OTUzYTJlMGQ3Mzo0MTUxZTIzM2U4MzgyYTE1ZjkzMTU2Y2RlODUxNDRiZQ=="},
      body: {
        "image_base64": base64Encode(image.readAsBytesSync())
      }
    );

    String json = response.body;

    Map data = jsonDecode(json);

    return _convert(data['result']['tags']);
  }

  List<Map<String, double>> _convert(List data){
    List<Map<String, double>> toret = new List(data.length);
    String element;
    double num;

    for (var i = 0; i<data.length; i++){
      element = data[i]['tag']['en'];
      num = data[i]['confidence'] + .0;
      toret[i] = {element: num};
    }

    return toret;
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
