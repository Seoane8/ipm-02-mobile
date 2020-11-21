import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageModel extends ChangeNotifier{
  File _image;
  Future<List<Map<String, double>>> _elements;

  File get image => _image;
  Future<List<Map<String, double>>> get elements => _elements;

  void loadData() {
    _elements = _getData();
  }

  void reloadData(){
    _elements = _getData();
    notifyListeners();
  }

  Future<List<Map<String, double>>> _getData() async {

    http.Response response = await http.post(
        'https://api.imagga.com/v2/tags',
        headers: {HttpHeaders.authorizationHeader:
        "Basic YWNjX2Q4NWI4OTUzYTJlMGQ3Mzo0MTUxZTIzM2U4MzgyYTE1ZjkzMTU2Y2RlODUxNDRiZQ=="},
        body: {
          "image_base64": base64Encode(_image.readAsBytesSync())
        }
    );

    String json = response.body;

    List data = jsonDecode(json)['result']['tags'];

    List<Map<String,double>> elements = data.map((x) {
      String elm = x['tag']['en'];
      double conf = x['confidence'] + .0;
      return {elm: conf};
    }).toList();

    return elements;
  }

  void setImage(File image) async{
    _image = image;

    notifyListeners();
  }
}