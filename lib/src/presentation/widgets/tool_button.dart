import 'package:flutter/material.dart';
import 'package:vs_story_designer/src/presentation/widgets/animated_onTap_button.dart';

class ToolButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final Color? backGroundColor;
  final EdgeInsets? padding;
  final Function()? onLongPress;
  final Color colorBorder;
  final bool? borderHide;
  const ToolButton(
      {super.key,
      required this.onTap,
      required this.child,
      this.backGroundColor,
      this.padding,
      this.onLongPress,
      this.colorBorder = Colors.white,
      this.borderHide = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: AnimatedOnTapButton(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(90),
            // elevation: 1,
            shadowColor: Colors.black.withValues(alpha: 0.5),
            child: Container(
              height: 36,
              width: 36,
              decoration: borderHide!
                  ? null
                  : BoxDecoration(
                      color: backGroundColor ?? Colors.transparent,
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white, width: 0.5)),
              child: Transform.scale(
                scale: 0.8,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
