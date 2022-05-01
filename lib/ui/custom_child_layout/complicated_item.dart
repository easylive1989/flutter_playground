import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/custom_child_layout/user_info.dart';

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

class UserInfoItem extends StatelessWidget {
  final UserInfo userInfo;

  const UserInfoItem({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.black,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(userInfo.avatar, width: 60),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userInfo.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(userInfo.aboutMe, style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UserTag(
                          icon: Icons.home_outlined,
                          value: userInfo.address.toString(),
                        ),
                        SizedBox(width: 8),
                        UserTag(
                          icon: Icons.remove_red_eye_outlined,
                          value: userInfo.views.toString(),
                        ),
                        SizedBox(width: 8),
                        UserTag(
                          icon: Icons.star_border,
                          value: userInfo.stars.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                UserInfoButton(text: "VIEW"),
                UserInfoButton(text: "INVITE"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserTag extends StatelessWidget {
  final IconData icon;
  final String value;

  const UserTag({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.lightBlue),
        Text(value),
      ],
    );
  }
}

class UserInfoButton extends StatelessWidget {
  final String text;

  const UserInfoButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(text, style: TextStyle(color: Colors.white)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
        ),
      ),
    );
  }
}
