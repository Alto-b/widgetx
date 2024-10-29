import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:widgetx/homepage.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    proceedToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.grey, Colors.grey.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "widget",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "X",
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 65,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "flutter",
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                GradientActivityIndicator(),
                Gap(55)
              ]),
        ),
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
            colors: [Colors.white],
            // colors: [
            //   Colors.blue,
            //   Colors.yellow,
            //   Colors.purple,
            //   Colors.red,
            //   Colors.blue
            // ],
            stops: [1.0],
            // stops: [0.2, 0.5, 0.5, 0.5, 1.0],
            startAngle: 0.0,
            endAngle: 1.0,
            tileMode: TileMode.repeated,
          ).createShader(bounds);
        },
        child: const CupertinoActivityIndicator(
          color: Colors.white,
          radius: 25,
        ),
      ),
    );
  }
}

Future<void> proceedToHome() async {
  Future.delayed(const Duration(seconds: 2)).then((value) {
    Get.offAll(const HomePageView(),
        transition: Transition.downToUp, duration: Duration(seconds: 1));
  });
}
