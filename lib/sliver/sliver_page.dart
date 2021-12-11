import 'package:flutter/material.dart';

import '../common/data.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNestedScrollView(context),
    );
  }

  NestedScrollView _buildNestedScrollView(BuildContext context) {
    return NestedScrollView(
      body: _buildImageListView(1),
      // body: _buildScrollImageColumn(10),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          // _buildSliverAppBar(floating: true, pinned: true),
          _buildPersistentHeader(),
        ];
      },
    );
  }

  Widget _buildCustomScrollView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // _buildSliverAppBar(floating: true, pinned: true),
        _buildPersistentHeader(),
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
            ),
      ],
    );
  }

  SingleChildScrollView _buildScrollImageColumn(int size) {
    return SingleChildScrollView(
      child: _buildImageColumn(size),
    );
  }

  Widget _buildPersistentHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MyPersistentHeaderDelegate(
        child: Text("abc"),
        min: 60,
        max: 120,
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

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double min;
  final double max;

  MyPersistentHeaderDelegate(
      {required this.child, required this.min, required this.max});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.center,
      child: child,
      color: Colors.grey,
    );
    return PreferredSize(
      child: child,
      preferredSize: Size(double.infinity, max),
    );
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
