import 'package:flutter/material.dart';
import 'dart:math';

import 'package:myerp/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showContent = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showContent = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (_, __) {
                return CustomPaint(
                  size: MediaQuery.of(context).size,
                  painter: WaveRisePainter(progress: _animation.value),
                );
              },
            ),

            if (showContent)
              Center(
                child: Column(
                  spacing: 6,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        "assets/images/logo-transparent-svg 1.png",
                      ),
                    ),
                    const SizedBox(height: 120),
                    Container(
                      color: Colors.white,
                      width: 311,
                      height: 52,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "GET STARTED",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 311,
                      height: 52,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),

                          side: const BorderSide(color: Colors.white),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "I ALREADY HAVE AN ACCOUNT",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class WaveRisePainter extends CustomPainter {
  final double progress;

  WaveRisePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.orange;

    final path = Path();

    double waveHeight = 25;
    double waveLength = size.width;
    double baseHeight = size.height * progress * 0.70;

    path.moveTo(0, baseHeight);

    for (double x = 0; x <= size.width; x++) {
      double y =
          sin((x / waveLength * 2 * pi) + progress * 4 * pi) * waveHeight +
          baseHeight;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WaveRisePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
