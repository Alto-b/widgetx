import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:widgetx/homepage.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Widget",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  Text(
                    "X",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 55,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Spacer(),
              GradientActivityIndicator(),
              Gap(35)
            ]),
      ),
    );
  }
}

class GradientActivityIndicator extends StatelessWidget {
  const GradientActivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const SweepGradient(
            colors: [
              Colors.blue,
              Colors.yellow,
              Colors.purple,
              Colors.red,
              Colors.blue
            ],
            stops: [0.2, 0.5, 0.5, 0.5, 1.0],
            startAngle: 0.0,
            endAngle: 1.0,
            tileMode: TileMode.repeated,
          ).createShader(bounds);
        },
        child: const CupertinoActivityIndicator(
          color: Colors.white,
          radius: 16,
        ),
      ),
    );
  }
}

Future<void> proceedToHome() async {
  Future.delayed(const Duration(seconds: 2)).then((value) {
    Get.offAll(const HomePageView());
  });
}
