import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/assets.gen.dart';
import '../../../generated/colors.gen.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, required this.isLoading, this.backgroundColor});
  final bool isLoading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: !isLoading,
        child: AnimatedOpacity(
          opacity: isLoading ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            color: backgroundColor ?? ColorName.purple969.withValues(alpha: 0.3),
            child: Center(
              child: Lottie.asset(
                Assets.lottie.loading,
                repeat: true,
                fit: BoxFit.cover,
                width: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
