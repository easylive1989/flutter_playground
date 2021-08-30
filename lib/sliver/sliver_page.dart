import 'package:flutter/material.dart';

import '../common/data.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              actions: [Icon(Icons.filter_list)],
              expandedHeight: 150,
              title: Text("App Bar Text"),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.call), text: "Call"),
                  Tab(icon: Icon(Icons.message), text: "Message"),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset("assets/app_bar.jpeg"),
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
    );
  }
}
