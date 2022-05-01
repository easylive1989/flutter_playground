import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return UserInfoItem();
        },
      ),
    );
  }
}

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({Key? key}) : super(key: key);

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/nicolas.jpeg", width: 60),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nicolas",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text("I Never Disrobe Before Gunplay.", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.home_outlined, color: Colors.lightBlue),
                          Text("Long Beach"),
                        ],
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined, color: Colors.lightBlue),
                          Text("9527"),
                        ],
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          Icon(Icons.star_border, color: Colors.lightBlue),
                          Text("141"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 80,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("VIEW", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("INVITE", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
