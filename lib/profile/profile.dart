import 'package:fitbyme/login.dart';
import 'package:fitbyme/profile/edit/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/profile_menu.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  get index => null;

  get list => null;

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PROFILE",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfileMenu(
              text: "Edit Profile",
              icon: "image/User Icon.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditPage(
                      list: list,
                      index: index,
                    ),
                  ),
                );
              },
            ),
            ProfileMenu(
              text: "Change Password",
              icon: "image/Lock.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "image/Log out.svg",
              press: () {
                logOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
