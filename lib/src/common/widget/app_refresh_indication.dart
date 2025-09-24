import 'package:flutter/material.dart';

import '../../../../generated/colors.gen.dart';

class AppRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  const AppRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      backgroundColor: ColorName.white,
      color: ColorName.black,
      child: Stack(
        children: [
          ListView(),
          child,
        ],
      ),
    );
  }
}
