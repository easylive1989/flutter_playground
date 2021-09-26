import 'package:flutter/material.dart';
import 'package:flutter_playground/common/data.dart';

class ImageCardList extends StatefulWidget {
  const ImageCardList({Key? key}) : super(key: key);

  @override
  _ImageCardListState createState() => _ImageCardListState();
}

class _ImageCardListState extends State<ImageCardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: imageUrlList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Card(
                margin: EdgeInsets.all(8),
                elevation: 5,
                // child: Text("123"),
                child: Image.network(
                  imageUrlList[index],
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
