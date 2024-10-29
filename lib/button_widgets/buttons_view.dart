import 'package:flutter/material.dart';
import 'package:widgetx/appbar.dart';
import 'package:widgetx/button_widgets/widgets/slide_to_action_button.dart';

class ButtonsView extends StatefulWidget {
  const ButtonsView({super.key});

  @override
  State<ButtonsView> createState() => _ButtonsViewState();
}

class _ButtonsViewState extends State<ButtonsView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        screenHeight: screenHeight,
        title: "Buttons",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [SlideToActionButton(), SlideToActionButton()],
        ),
      ),
    );
  }
}
