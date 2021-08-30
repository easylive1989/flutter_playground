import 'package:flutter/material.dart';
import 'package:flutter_playground/common/data.dart';

class NetworkImageList extends StatelessWidget {
  NetworkImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      itemBuilder: (context, index) {
        print("network image build");
        return Container(
          width: double.infinity,
          child: Image.network(imageUrlList[index]),
        );

        return Container(
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network(imageUrlList[index]).image,
            ),
          ),
        );
      },
      itemCount: imageUrlList.length,
    );
  }
}
