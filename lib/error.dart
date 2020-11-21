import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:image_analyzer/imageModel.dart';
import 'package:provider/provider.dart';

class ErrorPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageModel>(
      builder: (context, model, child) => Stack(
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
      ),
    );
  }
}