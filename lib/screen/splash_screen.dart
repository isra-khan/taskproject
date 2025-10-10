import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskgameproject/screen/widgets/custom_button.dart';
import 'package:taskgameproject/util/colorconstraint.dart';
import 'package:taskgameproject/util/routes/approutes.dart';
import 'package:taskgameproject/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastEaseInToSlowEaseOut, // gives a smooth bounce-in feel
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraint.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                "Manage your \n Daily TO DO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              ScaleTransition(
                scale: _scaleAnimation,
                child: SvgPicture.asset('assets/images/todo.svg', height: 500),
              ),

              const SizedBox(height: 20),
              const Text(
                "Without much worry just manage things as easy as piece of cake.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: CustomButton(
                  bgColor: ColorConstraint.yellowColor,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                  title: 'Create a Note',
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
