import 'package:flutter/material.dart';

import '../common/data.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCustomScrollView(context),
    );
  }

  NestedScrollView _buildNestedScrollView() {
    return NestedScrollView(
      body: _buildImageListView(1),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          _buildSliverAppBar(floating: true, pinned: true),
        ];
      },
    );
  }

  Widget _buildCustomScrollView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(floating: true, pinned: true),
        // SliverLayoutBuilder(builder: (context, constraints) {
        //   return Text("${constraints.viewportMainAxisExtent}");
        // }),
        _buildImageSliverList(1),
      ],
    );
  }

  Widget _buildCustomScrollViewWithRemaining(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(floating: true, pinned: true),
        SliverFillRemaining(
            // child: _buildImageListView(10), // List 自己可以滑動，App Bar 毫無反應
            // child: _buildImageColumn(10), // App Bar 可以縮放，但是 Column 無法滑到最下面
            // child: _buildImageColumn(1), // 只有一張圖片依舊可以往上滑，導致 App bar 蓋到 Column
            )
      ],
    );
  }

  Widget _buildContainer() {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.green,
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

  SliverList _buildImageSliverList(int size) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Image.network(imageUrlList[index]);
        },
        childCount: size,
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(
      {required bool floating, required bool pinned}) {
    return SliverAppBar(
      floating: floating,
      pinned: pinned,
      automaticallyImplyLeading: false,
      expandedHeight: 100,
      title: Text("Title"),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Image.network(
          imageUrlList[0],
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
