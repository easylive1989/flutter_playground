import 'package:flutter/material.dart';
import 'package:flutter_playground/common/data.dart';

class BottomScrollExample extends StatefulWidget {
  const BottomScrollExample({Key? key}) : super(key: key);

  @override
  State<BottomScrollExample> createState() => _BottomScrollExampleState();
}

class _BottomScrollExampleState extends State<BottomScrollExample> {
  double offset = 200;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: 200,
              color: Colors.green,
            ),
            NotificationListener<ScrollUpdateNotification>(
              onNotification: (notification) {
                setState(() {
                  double incre = notification.scrollDelta ?? 0.0;
                  if (offset > 0 && offset < 200) {
                    setState(() {
                      offset += incre;
                      if (offset > 200) offset = 200.0;
                      if (offset < 0) offset = 0.0;
                    });
                  }
                  print("paul ${notification.scrollDelta}");
                });
                return true;
              },
              child: Transform.translate(
                offset: Offset(0, 200),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      TabBar(tabs: [Tab(text: "abc")]),
                      Expanded(
                        child: TabBarView(children: [
                          _buildImageListView(10),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: -200,
            //   child: SingleChildScrollView(
            //     child: Container(
            //       height: MediaQuery.of(context).size.height + 200,
            //       width: MediaQuery.of(context).size.width,
            //       child: Column(
            //         children: [
            //           SizedBox(
            //             height: 200,
            //           ),
            //           TabBar(tabs: [Tab(text: "abc")]),
            //           Expanded(
            //             child: TabBarView(children: [
            //               _buildImageListView(10),
            //             ]),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  ListView _buildImageListView(int size) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: size,
      itemBuilder: (context, index) {
        return Image.network(imageUrlList[index]);
      },
    );
  }

  Widget _buildImageColumn(int size) {
    return Column(
      children:
          List.generate(size, (index) => Image.network(imageUrlList[index]))
              .toList(),
    );
  }
}
