import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskgameproject/screen/widgets/custom_button.dart';
import 'package:taskgameproject/util/colorconstraint.dart';
import 'package:taskgameproject/util/routes/approutes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraint.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Text(
                "Manage your \n Daily TO DO",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              SvgPicture.asset('assets/images/todo.svg', height: 500),
              SizedBox(height: 20),
              Text(
                "Without much worry just manage things as easy as piece of cake.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),
              Container(
                width: 150,
                child: CustomButton(
                  bgColor: ColorConstraint.yellowColor,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                  title: 'Create a Note',
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
