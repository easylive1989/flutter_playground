import 'package:flutter/material.dart';

import '../common/data.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                automaticallyImplyLeading: false,
                // actions: [Icon(Icons.filter_list)],
                expandedHeight: 100,
                toolbarHeight: 50,
                title: Container(
                    width: MediaQuery.of(context).size.height,
                    // color: Colors.red,
                    child: Text("App Bar Text")),
                // leading: Text("Back Button"),
                // bottom: TabBar(
                //   tabs: [
                //     Tab(icon: Icon(Icons.call), text: "Call"),
                //     Tab(icon: Icon(Icons.message), text: "Message"),
                //   ],
                // ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    color: Colors.green,
                    height: 100,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Something else")),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Image.network(imageUrlList[index]);
                },
                childCount: imageUrlList.length,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
