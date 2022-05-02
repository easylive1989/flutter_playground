import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/custom_child_layout/user_info.dart';
import 'package:flutter_playground/ui/custom_child_layout/user_info_button.dart';
import 'package:flutter_playground/ui/custom_child_layout/user_tag.dart';

class CustomUserInfoItem extends StatelessWidget {
  final UserInfo userInfo;

  const CustomUserInfoItem({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Colors.black,
          ),
        ),
        child: CustomMultiChildLayout(
          delegate: CustomUserInfoItemDelegate(),
          children: [
            LayoutId(
              id: CustomUserInfoItemDelegate.avatarId,
              child: Image.asset(userInfo.avatar, width: 60),
            ),
            LayoutId(
              id: CustomUserInfoItemDelegate.nameId,
              child: Text(userInfo.name, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            LayoutId(
              id: CustomUserInfoItemDelegate.aboutMeId,
              child: Text(userInfo.aboutMe, style: TextStyle(fontSize: 10)),
            ),
            LayoutId(
              id: CustomUserInfoItemDelegate.addressId,
              child: UserTag(
                icon: Icons.home_outlined,
                value: userInfo.address.toString(),
              ),
            ),
            LayoutId(
              id: CustomUserInfoItemDelegate.viewsId,
              child: UserTag(
                icon: Icons.remove_red_eye_outlined,
                value: userInfo.views.toString(),
              ),
            ),
            LayoutId(
              id: CustomUserInfoItemDelegate.starsId,
              child: UserTag(
                icon: Icons.star_border,
                value: userInfo.stars.toString(),
              ),
            ),
            LayoutId(
              id: CustomUserInfoItemDelegate.viewButtonId,
              child: UserInfoButton(text: "VIEW"),
            ),
            LayoutId(
              id: CustomUserInfoItemDelegate.inviteButtonId,
              child: UserInfoButton(text: "INVITE"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomUserInfoItemDelegate extends MultiChildLayoutDelegate {
  static const int nameId = 1;
  static const int aboutMeId = 2;
  static const int avatarId = 3;
  static const int addressId = 4;
  static const int viewsId = 5;
  static const int starsId = 6;
  static const int viewButtonId = 7;
  static const int inviteButtonId = 8;

  double height = 0;

  @override
  void performLayout(Size size) {
    Size? avatarSize;
    if (hasChild(avatarId)) {
      avatarSize = layoutChild(avatarId, BoxConstraints());
      height = avatarSize.height;
      positionChild(avatarId, Offset(8, 8));
    }
    Size? nameSize;
    if (hasChild(nameId)) {
      nameSize = layoutChild(nameId, BoxConstraints());
      positionChild(nameId, Offset(avatarSize!.width + 8 + 8, 16));
    }
    Size? aboutMeSize;
    if (hasChild(aboutMeId)) {
      aboutMeSize = layoutChild(aboutMeId, BoxConstraints());
      positionChild(aboutMeId, Offset(avatarSize!.width + 8 + 8, nameSize!.height + aboutMeSize.height + 8));
    }
    Size? addressSize;
    if (hasChild(addressId)) {
      addressSize = layoutChild(addressId, BoxConstraints());
      positionChild(addressId, Offset(8, avatarSize!.height + 8 + 8));
    }
    Size? viewsSize;
    if (hasChild(viewsId)) {
      viewsSize = layoutChild(viewsId, BoxConstraints());
      positionChild(viewsId, Offset(addressSize!.width + 8 + 8, avatarSize!.height + 8 + 8));
    }
    Size? starsSize;
    if (hasChild(starsId)) {
      starsSize = layoutChild(starsId, BoxConstraints());
      positionChild(starsId, Offset(addressSize!.width + viewsSize!.width + 8 + 8 + 8, avatarSize!.height + 8 + 8));
    }
    Size? viewButtonSize;
    if (hasChild(viewButtonId)) {
      viewButtonSize = layoutChild(viewButtonId, BoxConstraints());
      positionChild(viewButtonId, Offset(size.width - viewButtonSize.width - 8, 8));
    }
    Size? inviteButtonSize;
    if (hasChild(inviteButtonId)) {
      inviteButtonSize = layoutChild(inviteButtonId, BoxConstraints());
      positionChild(inviteButtonId, Offset(size.width - inviteButtonSize.width - 8, viewButtonSize!.height + 8));
    }
  }


  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, height);
  }

  @override
  bool shouldRelayout(covariant CustomUserInfoItemDelegate oldDelegate) {
    return this != oldDelegate;
  }
}
