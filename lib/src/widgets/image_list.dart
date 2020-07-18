import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  Widget buildImage(ImageModel image) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Image.network(image.url),
            Text(image.title),
          ],
        ));
  }

  @override
  Widget build(context) {
    // TODO: implement build
    return ListView.builder(
      // itemCount is to determine how many we pic need to show
      itemCount: images.length,
      //telling dart how many pic / function call it should do
      itemBuilder: (context, int index) {
        return buildImage(images[index]);

        // return Image.network(images[index].url);
      },
    );
  }
}
