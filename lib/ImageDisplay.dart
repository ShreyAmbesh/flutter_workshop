import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/GridItemModel.dart';

class ImageDisplay extends StatelessWidget {
  GridItemModel item;

  ImageDisplay(this.item);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.item.name),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
            child: Hero(
                tag: item.imageURL,
                child: Image(image: CachedNetworkImageProvider(this.item.imageURL)))),
      ),
    );
  }
}
