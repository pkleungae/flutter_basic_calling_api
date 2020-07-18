import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    // get the raw json data
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    // parseJson
    // result['key']
    var result = json.decode(response.body);
    var imageModel = ImageModel.fromJson(result);

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: ImageList(images),
          // function reference
          floatingActionButton: FloatingActionButton(
            onPressed: fetchImage,
          ),
          appBar: AppBar(
            title: Text('About to show image'),
          ),
        ));
  }
}