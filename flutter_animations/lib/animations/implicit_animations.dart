import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_animations/constants/constants.dart';

class ItemPicker extends StatefulWidget {
  const ItemPicker({
    Key? key,
    required this.containerHeight,
  }) : super(key: key);

  final double containerHeight;

  @override
  State<ItemPicker> createState() => _ItemPickerState();
}

class _ItemPickerState extends State<ItemPicker> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    const double listContainerBorderWidth = 1.5;
    const int itemsCount = 8;
    double itemHeight =
        (widget.containerHeight - listContainerBorderWidth * 2) / itemsCount;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          AnimatedPositioned(
            top: selectedItemIndex * itemHeight,
            left: 0,
            right: 0,
            height: itemHeight,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                8,
                (i) => Expanded(
                  child: InkWell(
                    onTap: () => setState(() => selectedItemIndex = i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'List Item ${i + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            if (i == 3)
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastEaseInToSlowEaseOut,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: selectedItemIndex == i
                                      ? Constants.yellow
                                      : Constants.pink,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: selectedItemIndex == i
                                        ? Colors.white
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 500),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: selectedItemIndex == i
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  child: const Text('Featured!'),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    Key? key,
    this.containerHeight = 120,
    this.child,
  }) : super(key: key);

  final double containerHeight;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          clipBehavior: Clip.none,
          height: containerHeight,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

class BlurSlider extends StatefulWidget {
  const BlurSlider({Key? key}) : super(key: key);

  @override
  State<BlurSlider> createState() => _BlurSliderState();
}

class _BlurSliderState extends State<BlurSlider> {
  double _sliderValue = 0.01;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 0.01, end: _sliderValue),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Slider(
          value: _sliderValue,
          min: 0.01,
          onChanged: (value) {
            setState(() => _sliderValue = value);
          },
        ),
      ),
      builder: (BuildContext context, double? value, Widget? child) {
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 40 * (value ?? 0.01),
              sigmaY: 40 * (value ?? 0.01),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
