// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/widgets.dart';

/// A utility class for predefined spacing constants.
/// Provides easy access to common spacing sizes used throughout the app.
///
/// We use the spacings used in the Figma Designs. Where they use spacing1 through spacingX
/// In the code s == spacing.
///
/// You can use it with shortcuts by using the `.vertical` & `.horizontal`
///
/// Example:
///
/// ```
/// Widget example = Column(
///   children: [
///     AppSpacing.vertical.s3, // Equivalent to SizedBox(height: AppSpacing.s3)
///     AppSpacing.horizontal.s5, // Equivalent to SizedBox(width: AppSpacing.s5)
///     // ... other widgets
///   ],
/// );
/// ```

class AppSpacing {
  const AppSpacing._();

  /// 0px
  static const double none = 0;

  /// 2px
  static const double s1 = 2;

  /// 4px
  static const double s2 = 4;

  /// 8px
  static const double s3 = 8;

  /// 12px
  static const double s4 = 12;

  /// 16px
  static const double s5 = 16;

  /// 24px
  static const double s6 = 24;

  /// 28px
  static const double s7 = 28;

  /// 32px
  static const double s8 = 32;

  /// 40px
  static const double s9 = 40;

  /// 48px
  static const double s10 = 48;

  /// Provides vertical spacing as [SizedBox] widgets.
  static _VerticalSpacing get vertical => const _VerticalSpacing();

  /// Provides horizontal spacing as [SizedBox] widgets.
  static _HorizontalSpacing get horizontal => const _HorizontalSpacing();
}

/// Internal class for creating vertical spacing.
class _VerticalSpacing {
  const _VerticalSpacing();

  /// Vertical spacing of 0 pixels.
  SizedBox get none => const SizedBox.shrink();

  /// Expand in the vertical axis
  SizedBox get expand => const SizedBox(height: double.infinity);

  /// Vertical spacing of 2 pixels.
  SizedBox get s1 => const SizedBox(height: AppSpacing.s1);

  /// Vertical spacing of 4 pixels.
  SizedBox get s2 => const SizedBox(height: AppSpacing.s2);

  /// Vertical spacing of 8 pixels.
  SizedBox get s3 => const SizedBox(height: AppSpacing.s3);

  /// Vertical spacing of 12 pixels.
  SizedBox get s4 => const SizedBox(height: AppSpacing.s4);

  /// Vertical spacing of 16 pixels.
  SizedBox get s5 => const SizedBox(height: AppSpacing.s5);

  /// Vertical spacing of 24 pixels.
  SizedBox get s6 => const SizedBox(height: AppSpacing.s6);

  /// Vertical spacing of 28 pixels.
  SizedBox get s7 => const SizedBox(height: AppSpacing.s7);

  /// Vertical spacing of 32 pixels.
  SizedBox get s8 => const SizedBox(height: AppSpacing.s8);

  /// Vertical spacing of 40 pixels.
  SizedBox get s9 => const SizedBox(height: AppSpacing.s9);

  /// Vertical spacing of 48 pixels.
  SizedBox get s10 => const SizedBox(height: AppSpacing.s10);
}

/// Internal class for creating horizontal spacing.
class _HorizontalSpacing {
  const _HorizontalSpacing();

  /// Horizontal spacing of 0 pixels.
  SizedBox get none => const SizedBox.shrink();

  /// Expand in the vertical axis
  SizedBox get expand => const SizedBox(width: double.infinity);

  /// Horizontal spacing of 2 pixels.
  SizedBox get s1 => const SizedBox(width: AppSpacing.s1);

  /// Horizontal spacing of 4 pixels.
  SizedBox get s2 => const SizedBox(width: AppSpacing.s2);

  /// Horizontal spacing of 8 pixels.
  SizedBox get s3 => const SizedBox(width: AppSpacing.s3);

  /// Horizontal spacing of 12 pixels.
  SizedBox get s4 => const SizedBox(width: AppSpacing.s4);

  /// Horizontal spacing of 16 pixels.
  SizedBox get s5 => const SizedBox(width: AppSpacing.s5);

  /// Horizontal spacing of 24 pixels.
  SizedBox get s6 => const SizedBox(width: AppSpacing.s6);

  /// Horizontal spacing of 28 pixels.
  SizedBox get s7 => const SizedBox(width: AppSpacing.s7);

  /// Horizontal spacing of 32 pixels.
  SizedBox get s8 => const SizedBox(width: AppSpacing.s8);

  /// Horizontal spacing of 40 pixels.
  SizedBox get s9 => const SizedBox(width: AppSpacing.s9);

  /// Horizontal spacing of 48 pixels.
  SizedBox get s10 => const SizedBox(width: AppSpacing.s10);
}
