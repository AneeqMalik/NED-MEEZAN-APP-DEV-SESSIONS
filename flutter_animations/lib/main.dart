import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/explicit_animations.dart';
import 'package:flutter_animations/animations/implicit_animations.dart';
import 'package:flutter_animations/utils/wrapper.dart';

void main() {
  runApp(const MyApp());
}


// Implicit animations with AnimatedContainer, AnimatedPadding

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double listContainerHeight = MediaQuery.of(context).size.height - 150;

    return PageWrapper(
      containerHeight: listContainerHeight,
      body: SafeArea(
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              BlurContainer(
                containerHeight: listContainerHeight,
                child: ItemPicker(containerHeight: listContainerHeight),
              ),
              const SizedBox(height: 20),
              const BlurSlider(),
              const SizedBox(height: 20),
              const ExplicitAnimations(),
              const SizedBox(height: 20),
              const AnimatedBuilderExample()
            ],
          ),
        ),
      ),
    );
  }
}

