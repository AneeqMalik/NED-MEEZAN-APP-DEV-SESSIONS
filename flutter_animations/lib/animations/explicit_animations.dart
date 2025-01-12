import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/implicit_animations.dart';
import 'package:flutter_animations/constants/constants.dart';


class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      containerHeight: 200,
      child: AlignTransition(
        alignment: _alignAnimation,
        child: RotationTransition(
          turns: _rotationAnimation,
          child: const Rectangle(
            color1: Constants.pink,
            color2: Constants.pinkDark,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}

class Rectangle extends StatelessWidget {
  const Rectangle({
    Key? key,
    this.width = 60,
    this.height = 40,
    required this.color1,
    required this.color2,
    this.top,
    this.bottom,
    this.left,
    this.right,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color1;
  final Color color2;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}


class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [Constants.purple, Constants.pink, Constants.yellow],
              stops: [0, _controller.value, 1],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white),
          ),
        );
      },
    );
  }
}
