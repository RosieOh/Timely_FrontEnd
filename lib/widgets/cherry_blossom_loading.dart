import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CherryBlossomLoading extends StatefulWidget {
  const CherryBlossomLoading({super.key});

  @override
  State<CherryBlossomLoading> createState() => _CherryBlossomLoadingState();
}

class _CherryBlossomLoadingState extends State<CherryBlossomLoading> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 10));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[50],
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(color: Colors.pink),
                SizedBox(height: 20),
                Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ConfettiWidget(
            confettiController: _controller,
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.1,
            numberOfParticles: 20,
            gravity: 0.05,
            shouldLoop: true,
            colors: const [
              Colors.pink,
              Colors.pinkAccent,
              Colors.white,
            ],
            createParticlePath: (size) {
              // Simple cherry blossom petal shape
              final path = Path();
              path.addOval(Rect.fromCircle(center: Offset.zero, radius: 5));
              return path;
            },
          ),
        ],
      ),
    );
  }
}
