import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgetx/code_view.dart';

class SlideToActionButton extends StatefulWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color sliderColor;
  final String labelText;

  const SlideToActionButton({
    Key? key,
    this.height = 60,
    this.width = 300,
    this.backgroundColor = Colors.grey,
    this.sliderColor = Colors.blue,
    this.labelText = "Slide to confirm",
  }) : super(key: key);

  @override
  _SlideToActionButtonState createState() => _SlideToActionButtonState();
}

class _SlideToActionButtonState extends State<SlideToActionButton> {
  double _sliderPosition = 0.0;
  bool _isCompleted = false;
  final String title = "Sliding Button";
  final String code = '''

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgetx/code_view.dart';

class SlideToActionButton extends StatefulWidget {
  final VoidCallback onSlideComplete;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color sliderColor;
  final String labelText;

  const SlideToActionButton({
    Key? key,
    required this.onSlideComplete,
    this.height = 60,
    this.width = 300,
    this.backgroundColor = Colors.grey,
    this.sliderColor = Colors.blue,
    this.labelText = "Slide to confirm",
  }) : super(key: key);

  @override
  _SlideToActionButtonState createState() => _SlideToActionButtonState();
}

class _SlideToActionButtonState extends State<SlideToActionButton> {
  double _sliderPosition = 0.0;
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _isCompleted ? Colors.green : widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.height / 2),
        boxShadow: [
          if (_isCompleted)
            BoxShadow(
              color: Colors.green.withOpacity(0.6),
              spreadRadius: 4,
              blurRadius: 20,
            ),
        ],
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Center(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Text(
                _isCompleted ? "Confirmed!" : widget.labelText,
                key: ValueKey(_isCompleted),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: _sliderPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _sliderPosition += details.delta.dx;
                  _sliderPosition =
                      _sliderPosition.clamp(0.0, widget.width - widget.height);
                });
              },
              onHorizontalDragEnd: (details) {
                if (_sliderPosition >= widget.width - widget.height) {
                  setState(() {
                    _isCompleted = true;
                  });
                  widget.onSlideComplete();
                } else {
                  setState(() {
                    _sliderPosition = 0.0;
                  });
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: widget.height,
                height: widget.height,
                decoration: BoxDecoration(
                  color: widget.sliderColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

...
''';

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _isCompleted ? Colors.green : widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.height / 2),
        boxShadow: [
          if (_isCompleted)
            BoxShadow(
              color: Colors.green.withOpacity(0.6),
              spreadRadius: 4,
              blurRadius: 20,
            ),
        ],
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                _isCompleted ? "Confirmed!" : widget.labelText,
                key: ValueKey(_isCompleted),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _sliderPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _sliderPosition += details.delta.dx;
                  _sliderPosition =
                      _sliderPosition.clamp(0.0, widget.width - widget.height);
                });
              },
              onHorizontalDragEnd: (details) {
                if (_sliderPosition >= widget.width - widget.height) {
                  setState(() {
                    _isCompleted = true;
                  });
                  // Navigate to CodeView
                  Get.to(
                    CodeView(title: title, code: code),
                    transition: Transition.leftToRight,
                  )?.then((_) {
                    // Reset the button state after returning
                    setState(() {
                      _isCompleted = false;
                      _sliderPosition = 0.0;
                    });
                  });
                } else {
                  // Reset slider position if not fully slid
                  setState(() {
                    _sliderPosition = 0.0;
                  });
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: widget.height,
                height: widget.height,
                decoration: BoxDecoration(
                  color: widget.sliderColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
