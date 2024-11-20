import 'package:chat_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> slideAnimation;
  late Animation<double> fontSizeAnimation;

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, (1 - slideAnimation.value) * 100),
              child: Text(
                'Talker',
                style: TextStyle(
                  fontSize: fontSizeAnimation.value,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void initAnimations() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // Slide up animation
    slideAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.6, curve: Curves.easeOut)));

    // Font size animation
    fontSizeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 20.0, end: 60.0),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 60.0, end: 100.0),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.6, 1, curve: Curves.easeInOut)));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 2000), () {
          GoRouter.of(context).go(AppRouter.login);
        });
      }
    });

    controller.forward();
  }
}
