import 'package:flutter/material.dart';

class Tappable extends StatelessWidget {
  final Color color;
  final Widget child;
  final BorderRadius borderRadius;
  final GestureTapCallback onTap;
  final EdgeInsetsGeometry padding;
  Tappable({
    this.color = Colors.transparent,
    this.padding,
    this.borderRadius,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          padding: padding,
          child: child,
        ),
      )
    );
  }
}
