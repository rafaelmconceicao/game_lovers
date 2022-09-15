import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) => Shimmer(
    duration: const Duration(milliseconds: 1500),
        color: Colors.black,
        child: Container(
          height: height,
          width: width,
          color: Colors.grey.shade300,
        ),
      );
}
