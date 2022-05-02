import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/custom_child_layout/user_info.dart';
import 'package:flutter_playground/ui/custom_child_layout/user_info_button.dart';
import 'package:flutter_playground/ui/custom_child_layout/user_tag.dart';

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
                              Text(userInfo.name, style: TextStyle(fontWeight: FontWeight.bold)),
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
