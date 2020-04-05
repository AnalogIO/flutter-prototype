import 'package:flutter/material.dart';
import 'package:analog_app/utils/colors.dart';

class Tappable extends StatelessWidget {
  final Color color;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final BoxBorder border;
  final List<BoxShadow> boxShadow;
  @required final GestureTapCallback onTap;
  @required final Widget child;
  Tappable({
    this.color = Colors.transparent,
    this.padding,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final bool lightSplash =
      (color == AppColors.white || color == AppColors.primary);
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        borderRadius: borderRadius,
        border: border
      ),
      child: Material(
        color: color,
        borderRadius: borderRadius,
        child: InkWell(
          highlightColor: (lightSplash)
            ? null
            : AppColors.primary.withOpacity(0.12),
          splashColor: (lightSplash)
            ? null
            : AppColors.primary.withOpacity(0.12),
          onTap: onTap,
          borderRadius: borderRadius,
          child: Container(
            padding: padding,
            child: child,
          ),
        )
      ),
    );
  }
}
