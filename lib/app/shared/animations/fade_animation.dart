import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final Widget child;
  final double delay;

  FadeAnimation({
    Key key,
    @required this.delay,
    @required this.child,
  }) : super(key: key);

  final _tween = MultiTween<AnimProps>()
    ..add(
      AnimProps.opacity,
      Tween(begin: 0.0, end: 1.0),
      Duration(milliseconds: 500),
    )
    ..add(
      AnimProps.translateY,
      Tween(begin: -30.0, end: 0.0),
      Duration(milliseconds: 500),
    );

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<MultiTweenValues<AnimProps>>(
      tween: _tween,
      duration: _tween.duration,
      child: child,
      delay: Duration(milliseconds: (500 * delay).round()),
      builder: (context, child, value) {
        return Opacity(
          opacity: value.get(AnimProps.opacity),
          child: Transform.translate(
            offset: Offset(
              0.0,
              value.get(AnimProps.translateY),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

enum AnimProps { opacity, translateY }
