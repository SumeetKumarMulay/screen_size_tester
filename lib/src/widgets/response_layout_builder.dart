
import 'package:flutter/material.dart';

/// This is the responsive layouts class build using google's material layout breakpoint 
/// guidelines which can be found by following the link below.
/// LINK:: https://m2.material.io/design/layout/responsive-layout-grid.html#breakpoints

class ResponseLayoutBuilder extends StatelessWidget {
  final Widget extraSmall;
  final Widget small;
  final Widget medium;
  final Widget large;
  final Widget extraLarge;
  const ResponseLayoutBuilder({
    super.key,
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        if (width < 600) {
          return extraSmall; // Extra-small devices
        } else if (width < 840) {
          return small; // Small devices
        } else if (width < 960) {
          return medium; // Medium devices
        } else if (width < 1280) {
          return large; // Large devices
        } else {
          return extraLarge; // Extra-large devices
        }
      },
    );
  }
}