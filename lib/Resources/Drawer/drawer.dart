import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/View/Chat_App/Models/user_models.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  final UserModel targetUser;

  void Function()? ontap;
  MyDrawer({
    Key? key,
    this.ontap,
    required this.userModel,
    required this.firebaseUser,
    required this.targetUser,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.blue,
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(
                      widget.targetUser.profilePic.toString(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.userModel.fullname ?? 'User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    widget.userModel.email ?? 'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ListTile(
          //   iconColor: Colors.black,
          //   textColor: Colors.black,
          //   leading: Icon(Icons.chat),
          //   title: Text("Chats".tr),
          //   onTap: () {
          //     Get.to(() => Home(
          //         userModel: widget.userModel,
          //         firebaseUser: widget.firebaseUser));
          //   },
          // ),

          // Divider(
          //   thickness: 2,
          //   color: Colors.grey[300],
          // ),

          ListTile(
            iconColor: Colors.black,
            textColor: Colors.black,
            leading: Icon(Icons.account_circle),
            title: Text("Your Account".tr),
            onTap: () {},
          ),

          Divider(
            thickness: 2,
            color: Colors.grey[300],
          ),

          ListTile(
            iconColor: Colors.black,
            textColor: Colors.black,
            leading: Icon(Icons.settings),
            title: Text("Settings".tr),
            onTap: () {},
          ),

          Divider(
            thickness: 2,
            color: Colors.grey[300],
          ),

          ListTile(
              iconColor: Colors.black,
              textColor: Colors.black,
              leading: Icon(Icons.logout),
              title: Text("Logout".tr),
              onTap: widget.ontap),
        ],
      ),
    );
  }
}
