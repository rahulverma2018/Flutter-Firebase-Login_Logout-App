import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/signup.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.18,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white60,
                  radius: 80,
                  backgroundImage: AssetImage("images/profile1.png"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome :)",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "a@a.com",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Container(
            width: w * 0.4,
            height: h * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                image: AssetImage("images/loginbtn.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
