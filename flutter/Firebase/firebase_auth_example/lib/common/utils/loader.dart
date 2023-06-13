import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white.withOpacity(0.8),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
