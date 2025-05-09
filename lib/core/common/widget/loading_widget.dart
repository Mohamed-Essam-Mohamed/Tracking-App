import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/constants/app_assets.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final double rotationValue = _controller.value * 2 * 3.14;
          final bool isFlipped = (_controller.value > 0.25 && _controller.value < 0.75);

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(rotationValue),
            alignment: Alignment.center,
            child: isFlipped
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(3.14159265359),
                    child: SvgPicture.asset(
                      SvgAsset.flower,
                      width: 50,
                      height: 50,
                    ),
                  )
                : SvgPicture.asset(
                    SvgAsset.flower,
                    width: 50,
                    height: 50,
                  ),
          );
        },
      ),
    );
  }
}
