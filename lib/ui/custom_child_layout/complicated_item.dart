import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/custom_child_layout/user_info.dart';
import 'package:flutter_playground/ui/custom_child_layout/user_info_item.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<UserInfo> userList = [
      UserInfo(
        avatar: "assets/nicolas.jpeg",
        name: "Nicolas Cage",
        aboutMe: "I never disrobe before gunplay.",
        address: "Long Beach",
        views: 9527,
        stars: 141,
      ),
      UserInfo(
        avatar: "assets/yao_ming.png",
        name: "Yao Ming",
        aboutMe: "I'm just one of the 1.3 billion Chinese.",
        address: "China",
        views: 9527,
        stars: 141,
      ),
      UserInfo(
        avatar: "assets/jacky_chan.jpeg",
        name: "Jacky Chan",
        aboutMe: "I only want my work to make people happy.",
        address: "Hong Kong",
        views: 9527,
        stars: 141,
      )
    ];
    return Scaffold(
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          UserInfo userInfo = userList[index];
          return UserInfoItem(userInfo: userInfo);
        },
      ),
    );
  }
}