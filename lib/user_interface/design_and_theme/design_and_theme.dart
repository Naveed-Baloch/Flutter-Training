import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A comprehensive theme configuration for Flutter applications.
/// Following Material 3 design guidelines with custom color schemes and typography.

class AppTheme {
  // Brand colors
  static const Color primaryColor = Color(0xFF6750A4);
  static const Color secondaryColor = Color(0xFF9C27B0);
  static const Color tertiaryColor = Color(0xFF7D5260);

  // Custom colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFB00020);
  static const Color info = Color(0xFF2196F3);

  /// Light theme
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
        error: error,
      ),

      // Typography
      textTheme: _buildTextTheme(),

      // Component themes
      elevatedButtonTheme: _elevatedButtonTheme(isLight: true),
      outlinedButtonTheme: _outlinedButtonTheme(isLight: true),
      textButtonTheme: _textButtonTheme(isLight: true),
      inputDecorationTheme: _inputDecorationTheme(isLight: true),
      appBarTheme: _appBarTheme(isLight: true),
      cardTheme: _cardTheme(isLight: true),
      dialogTheme: _dialogTheme(isLight: true),
      bottomNavigationBarTheme: _bottomNavBarTheme(isLight: true),
      switchTheme: _switchTheme(isLight: true),
      chipTheme: _chipTheme(isLight: true),

      // Dividers, icons and more
      dividerTheme: _dividerTheme(isLight: true),
      iconTheme: _iconTheme(isLight: true),
      scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      floatingActionButtonTheme: _floatingActionButtonTheme(isLight: true),
    );
  }

  /// Dark theme
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
        error: const Color(0xFFCF6679),
      ),

      // Typography
      textTheme: _buildTextTheme(isLight: false),

      // Component themes
      elevatedButtonTheme: _elevatedButtonTheme(isLight: false),
      outlinedButtonTheme: _outlinedButtonTheme(isLight: false),
      textButtonTheme: _textButtonTheme(isLight: false),
      inputDecorationTheme: _inputDecorationTheme(isLight: false),
      appBarTheme: _appBarTheme(isLight: false),
      cardTheme: _cardTheme(isLight: false),
      dialogTheme: _dialogTheme(isLight: false),
      bottomNavigationBarTheme: _bottomNavBarTheme(isLight: false),
      switchTheme: _switchTheme(isLight: false),
      chipTheme: _chipTheme(isLight: false),

      // Dividers, icons and more
      dividerTheme: _dividerTheme(isLight: false),
      iconTheme: _iconTheme(isLight: false),
      scaffoldBackgroundColor: const Color(0xFF121212),
      floatingActionButtonTheme: _floatingActionButtonTheme(isLight: false),
    );
  }

  // Typography builder with font variations
  static TextTheme _buildTextTheme({bool isLight = true}) {
    final baseTextTheme = TextTheme(
      displayLarge: GoogleFonts.roboto(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        fontStyle: FontStyle.italic,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 45,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: GoogleFonts.roboto(
        fontSize: 36,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.oswald(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleMedium: GoogleFonts.oswald(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.oswald(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      bodyLarge: GoogleFonts.merriweather(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.merriweather(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.merriweather(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
    );

    // Apply color based on theme brightness
    if (isLight) {
      return baseTextTheme;
    } else {
      return baseTextTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      );
    }
  }

  // Elevated Button Theme
  static ElevatedButtonThemeData _elevatedButtonTheme({bool isLight = true}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // Outlined Button Theme
  static OutlinedButtonThemeData _outlinedButtonTheme({bool isLight = true}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(
          color: isLight ? primaryColor : Colors.white70,
          width: 1.5,
        ),
        textStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // Text Button Theme
  static TextButtonThemeData _textButtonTheme({bool isLight = true}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // Input Decoration Theme
  static InputDecorationTheme _inputDecorationTheme({bool isLight = true}) {
    return InputDecorationTheme(
      filled: true,
      fillColor: isLight ? Colors.grey.shade50 : Colors.grey.shade900,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isLight ? Colors.grey.shade300 : Colors.grey.shade700,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isLight ? Colors.grey.shade300 : Colors.grey.shade700,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isLight ? primaryColor : Colors.white70,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isLight ? error : const Color(0xFFCF6679),
          width: 1,
        ),
      ),
      labelStyle: TextStyle(
        color: isLight ? Colors.grey.shade700 : Colors.grey.shade300,
      ),
    );
  }

  // App Bar Theme
  static AppBarTheme _appBarTheme({bool isLight = true}) {
    return AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: isLight ? Colors.white : const Color(0xFF1E1E1E),
      titleTextStyle: GoogleFonts.oswald(
        color: isLight ? Colors.black87 : Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(
        color: isLight ? Colors.black87 : Colors.white,
      ),
    );
  }

  // Card Theme
  static CardTheme _cardTheme({bool isLight = true}) {
    return CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: isLight ? Colors.white : const Color(0xFF2C2C2C),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }

  // Dialog Theme
  static DialogTheme _dialogTheme({bool isLight = true}) {
    return DialogTheme(
      elevation: 24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: isLight ? Colors.white : const Color(0xFF2C2C2C),
      titleTextStyle: GoogleFonts.roboto(
        color: isLight ? Colors.black87 : Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      contentTextStyle: GoogleFonts.merriweather(
        color: isLight ? Colors.black87 : Colors.white70,
        fontSize: 16,
      ),
    );
  }

  // Bottom Navigation Bar Theme
  static BottomNavigationBarThemeData _bottomNavBarTheme(
      {bool isLight = true}) {
    return BottomNavigationBarThemeData(
      elevation: 8,
      selectedItemColor: primaryColor,
      unselectedItemColor:
      isLight ? Colors.grey.shade600 : Colors.grey.shade400,
      backgroundColor: isLight ? Colors.white : const Color(0xFF1E1E1E),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.roboto(
        fontSize: 12,
      ),
    );
  }

  // Switch Theme
  static SwitchThemeData _switchTheme({bool isLight = true}) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
        }
        if (states.contains(WidgetState.selected)) {
          return primaryColor;
        }
        return isLight ? Colors.grey.shade50 : Colors.grey.shade400;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return isLight ? Colors.grey.shade300 : Colors.grey.shade700;
        }
        if (states.contains(WidgetState.selected)) {
          return primaryColor.withValues(alpha: 0.5);
        }
        return isLight ? Colors.grey.shade300 : Colors.grey.shade700;
      }),
    );
  }

  // Chip Theme
  static ChipThemeData _chipTheme({bool isLight = true}) {
    return ChipThemeData(
      backgroundColor: isLight ? Colors.grey.shade100 : Colors.grey.shade800,
      disabledColor: isLight ? Colors.grey.shade200 : Colors.grey.shade700,
      selectedColor: primaryColor.withValues(alpha: 0.1),
      secondarySelectedColor: secondaryColor.withValues(alpha: 0.1),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: GoogleFonts.roboto(
        color: isLight ? Colors.black87 : Colors.white,
        fontSize: 14,
      ),
      secondaryLabelStyle: GoogleFonts.roboto(
        color: secondaryColor,
        fontSize: 14,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  // Divider Theme
  static DividerThemeData _dividerTheme({bool isLight = true}) {
    return DividerThemeData(
      color: isLight ? Colors.grey.shade200 : Colors.grey.shade800,
      thickness: 1,
      space: 16,
    );
  }

  // Icon Theme
  static IconThemeData _iconTheme({bool isLight = true}) {
    return IconThemeData(
      color: isLight ? Colors.grey.shade800 : Colors.grey.shade200,
      size: 24,
    );
  }

  // Floating Action Button Theme
  static FloatingActionButtonThemeData _floatingActionButtonTheme(
      {bool isLight = true}) {
    return FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 6,
      splashColor: secondaryColor.withValues(alpha: 0.3),
      hoverElevation: 8,
      focusElevation: 8,
      highlightElevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      extendedTextStyle: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0,
      ),
    );
  }
}

// Helper function to easily get theme based on brightness
ThemeData getAppTheme(Brightness brightness) {
  return brightness == Brightness.light
      ? AppTheme.lightTheme()
      : AppTheme.darkTheme();
}
