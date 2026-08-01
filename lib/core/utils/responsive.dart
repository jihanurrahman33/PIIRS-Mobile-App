import 'package:flutter/material.dart';

/// Responsive design breakpoints and layout utility.
abstract class ResponsiveBreakpoints {
  static const double mobile = 600.0;
  static const double tablet = 1024.0;
}

/// Extension on [BuildContext] for convenient responsive queries.
extension ResponsiveContext on BuildContext {
  /// Screen width in logical pixels.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Screen height in logical pixels.
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Returns `true` if screen width is less than 600dp.
  bool get isMobile => screenWidth < ResponsiveBreakpoints.mobile;

  /// Returns `true` if screen width is between 600dp and 1024dp.
  bool get isTablet =>
      screenWidth >= ResponsiveBreakpoints.mobile &&
      screenWidth < ResponsiveBreakpoints.tablet;

  /// Returns `true` if screen width is 1024dp or greater.
  bool get isDesktop => screenWidth >= ResponsiveBreakpoints.tablet;

  /// Returns value based on current device screen size breakpoint.
  T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }
}

/// Responsive Layout builder widget that renders appropriate UI per device size.
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ResponsiveBreakpoints.tablet) {
          return desktop ?? tablet ?? mobile;
        }
        if (constraints.maxWidth >= ResponsiveBreakpoints.mobile) {
          return tablet ?? mobile;
        }
        return mobile;
      },
    );
  }
}
