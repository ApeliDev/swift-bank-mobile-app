import 'package:flutter/material.dart';

class AnimatedNavIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const AnimatedNavIcon({
    Key? key,
    required this.icon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween<double>(begin: isActive ? 0.8 : 1.0, end: isActive ? 1.2 : 0.8),
      curve: Curves.easeInOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Icon(
            icon,
            color: isActive ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
