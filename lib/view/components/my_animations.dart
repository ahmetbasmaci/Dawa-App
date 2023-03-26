import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyAnimations {
  static Widget animationListItemUpToDown({required int index, required Widget child}) {
    return AnimationConfiguration.staggeredList(
      position: index,
      //delay: Duration(milliseconds: 100),
      child: KeyedSubtree(
        key: UniqueKey(),
        child: SlideAnimation(
          duration: Duration(milliseconds: 2500),
          curve: Curves.fastLinearToSlowEaseIn,
          verticalOffset: -250,
          child: ScaleAnimation(
            duration: Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            child: child,
          ),
        ),
      ),
    );
  }

  static Widget animationListItemDownToUp({required int index, required Widget child}) {
    return AnimationConfiguration.staggeredList(
      position: index,
      //delay: Duration(milliseconds: 100),
      child: KeyedSubtree(
        key: UniqueKey(),
        child: SlideAnimation(
          duration: Duration(milliseconds: 2500),
          curve: Curves.fastLinearToSlowEaseIn,
          horizontalOffset: 30,
          verticalOffset: 300.0,
          child: FlipAnimation(
            duration: Duration(milliseconds: 3000),
            curve: Curves.fastLinearToSlowEaseIn,
            flipAxis: FlipAxis.y,
            child: child,
          ),
        ),
      ),
    );
  }

  static Widget animationListItemLeftToRight({required int index, required Widget child}) {
    return AnimationConfiguration.staggeredList(
      position: index,
      //delay: Duration(milliseconds: 100),
      child: KeyedSubtree(
        key: UniqueKey(),
        child: SlideAnimation(
          duration: Duration(milliseconds: 2500),
          curve: Curves.fastLinearToSlowEaseIn,
          horizontalOffset: -200,
          child: ScaleAnimation(
            duration: Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            child: child,
          ),
        ),
      ),
    );
  }

  static Widget animationListItemRightToLeft({required int index, required Widget child}) {
    return AnimationConfiguration.staggeredList(
      position: index,
      //delay: Duration(milliseconds: 100),
      child: KeyedSubtree(
        key: UniqueKey(),
        child: SlideAnimation(
          duration: Duration(milliseconds: 2500),
          curve: Curves.fastLinearToSlowEaseIn,
          horizontalOffset: 200,
          child: ScaleAnimation(
            duration: Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            child: child,
          ),
        ),
      ),
    );
  }

  static Widget animationListItemFadeIn(
      {required int index, required Widget child}) {
    return AnimationConfiguration.staggeredList(
      position: index,
      //delay: Duration(milliseconds: 100),
      child: KeyedSubtree(
        key: UniqueKey(),
        child: ScaleAnimation(
          duration: Duration(milliseconds: 1500),
          curve: Curves.fastLinearToSlowEaseIn,
          child: FadeInAnimation(
            duration: Duration(milliseconds: 2500),
            curve: Curves.fastLinearToSlowEaseIn,
            child: child,
          ),
        ),
      ),
    );
  }
}
