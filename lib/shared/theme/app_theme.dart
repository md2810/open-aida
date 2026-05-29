import 'package:flutter/material.dart';

/// OpenAIDA Design System — Material 3 Expressive, dark-first.
///
/// Brand palette (immutable):
///   Blue   #3399CC — sea / primary / today
///   Green  #339900 — nature / secondary / spa
///   Red    #CC3300 — energy / tertiary / shows
///   Yellow #FFCC00 — sun / accent / account
///
/// Gradients are the signature accent. One bold gradient moment per screen.
class AppTheme {
  // ── Immutable brand hues ─────────────────────────────────────────────────
  static const Color aidaBlue   = Color(0xFF3399CC);
  static const Color aidaGreen  = Color(0xFF339900);
  static const Color aidaRed    = Color(0xFFCC3300);
  static const Color aidaYellow = Color(0xFFFFCC00);

  // ── Named gradients ──────────────────────────────────────────────────────
  /// Today / home hero — blue sea
  static const LinearGradient gradSea = LinearGradient(
    begin: Alignment(-0.7, -1),
    end: Alignment(1, 0.7),
    colors: [Color(0xFF3399CC), Color(0xFF2C7FB8), Color(0xFF2A5C99)],
    stops: [0.0, 0.5, 1.0],
  );

  /// Shows / program hero — sunrise (yellow → orange → red)
  static const LinearGradient gradSunrise = LinearGradient(
    begin: Alignment(-0.5, -1),
    end: Alignment(1, 0.5),
    colors: [Color(0xFFFFCC00), Color(0xFFFF7A00), Color(0xFFCC3300)],
    stops: [0.0, 0.55, 1.0],
  );

  /// Quick tile / POI — blue-to-green reef
  static const LinearGradient gradReef = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3399CC), Color(0xFF339900)],
  );

  /// Spa hero — green-to-yellow shore
  static const LinearGradient gradShore = LinearGradient(
    begin: Alignment(-0.5, -1),
    end: Alignment(1, 0.5),
    colors: [Color(0xFF339900), Color(0xFFFFCC00)],
  );

  /// Account balance hero — warm yellow/orange
  static const LinearGradient gradAccount = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFD23F), Color(0xFFFF9F1C), Color(0xFFFF6B35)],
    stops: [0.0, 0.6, 1.0],
  );

  /// Brand identity — full 4-colour AIDA sweep
  static const LinearGradient gradAida = LinearGradient(
    begin: Alignment(-0.9, -0.5),
    end: Alignment(1, 0.5),
    colors: [
      Color(0xFF3399CC),
      Color(0xFF339900),
      Color(0xFFFFCC00),
      Color(0xFFCC3300),
    ],
    stops: [0.0, 0.38, 0.70, 1.0],
  );

  // ── Light theme ──────────────────────────────────────────────────────────
  static ThemeData light() {
    const surface = Color(0xFFFBFCFE);

    final cs = const ColorScheme.light().copyWith(
      // Primary — Blue
      primary:             const Color(0xFF1A6E96),
      onPrimary:           Colors.white,
      primaryContainer:    const Color(0xFFC4E7FF),
      onPrimaryContainer:  const Color(0xFF001E2D),
      // Secondary — Green
      secondary:           const Color(0xFF256E00),
      onSecondary:         Colors.white,
      secondaryContainer:  const Color(0xFFA4F584),
      onSecondaryContainer:const Color(0xFF072100),
      // Tertiary — Red
      tertiary:            const Color(0xFFA82900),
      onTertiary:          Colors.white,
      tertiaryContainer:   const Color(0xFFFFDAD0),
      onTertiaryContainer: const Color(0xFF3A0A00),
      // Error
      error:               const Color(0xFFBA1A1A),
      onError:             Colors.white,
      errorContainer:      const Color(0xFFFFDAD6),
      onErrorContainer:    const Color(0xFF410002),
      // Surfaces
      surface:             surface,
      surfaceContainerLowest:  Colors.white,
      surfaceContainerLow:     const Color(0xFFF3F4F8),
      surfaceContainer:        const Color(0xFFEDEEF3),
      surfaceContainerHigh:    const Color(0xFFE7E8EE),
      surfaceContainerHighest: const Color(0xFFE1E3EA),
      // Text / lines
      onSurface:           const Color(0xFF1A1C20),
      onSurfaceVariant:    const Color(0xFF43474E),
      outline:             const Color(0xFF72767E),
      outlineVariant:      const Color(0xFFC2C6CF),
      inverseSurface:      const Color(0xFF2F3036),
      onInverseSurface:    const Color(0xFFF1F0F7),
      inversePrimary:      const Color(0xFF8AD0F5),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      textTheme: _buildTextTheme(cs),
      appBarTheme: AppBarTheme(
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
        scrolledUnderElevation: 2,
        shadowColor: Colors.black12,
        titleTextStyle: TextStyle(
          color: cs.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.3,
        ),
      ),
      navigationBarTheme: _navBarTheme(cs),
      cardTheme: _cardTheme(cs),
      tabBarTheme: _tabBarTheme(cs),
      chipTheme: _chipTheme(cs),
      inputDecorationTheme: _inputTheme(cs),
      elevatedButtonTheme: _elevatedBtn(cs),
      outlinedButtonTheme: _outlinedBtn(cs),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: cs.primary,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      dividerTheme: DividerThemeData(
        color: cs.outlineVariant, thickness: 1, space: 0,
      ),
      iconTheme: IconThemeData(color: cs.onSurfaceVariant, size: 24),
      scaffoldBackgroundColor: surface,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: cs.inverseSurface,
        contentTextStyle: TextStyle(color: cs.onInverseSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: cs.surfaceContainerLow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        showDragHandle: true,
        dragHandleColor: cs.onSurfaceVariant.withValues(alpha: 0.4),
        dragHandleSize: const Size(36, 4),
        elevation: 1,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: cs.secondaryContainer,
        foregroundColor: cs.onSecondaryContainer,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  // ── Dark theme ───────────────────────────────────────────────────────────
  static ThemeData dark() {
    const surface = Color(0xFF121419);

    final cs = const ColorScheme.dark().copyWith(
      // Primary — Blue (light tonal in dark theme)
      primary:             const Color(0xFF8AD0F5),
      onPrimary:           const Color(0xFF00344A),
      primaryContainer:    const Color(0xFF004C6B),
      onPrimaryContainer:  const Color(0xFFC4E7FF),
      // Secondary — Green
      secondary:           const Color(0xFF7FD862),
      onSecondary:         const Color(0xFF0A3900),
      secondaryContainer:  const Color(0xFF1B5200),
      onSecondaryContainer:const Color(0xFFA4F584),
      // Tertiary — Red
      tertiary:            const Color(0xFFFFB59C),
      onTertiary:          const Color(0xFF5C1300),
      tertiaryContainer:   const Color(0xFF812000),
      onTertiaryContainer: const Color(0xFFFFDAD0),
      // Error
      error:               const Color(0xFFFFB4AB),
      onError:             const Color(0xFF690005),
      errorContainer:      const Color(0xFF93000A),
      onErrorContainer:    const Color(0xFFFFDAD6),
      // Surfaces — neutral grey ladder
      surface:             surface,
      surfaceContainerLowest:  const Color(0xFF0C0E12),
      surfaceContainerLow:     const Color(0xFF1A1C22),
      surfaceContainer:        const Color(0xFF1E2026),
      surfaceContainerHigh:    const Color(0xFF282B32),
      surfaceContainerHighest: const Color(0xFF33363E),
      // Text / lines
      onSurface:           const Color(0xFFE6E8EE),
      onSurfaceVariant:    const Color(0xFFC2C6D0),
      outline:             const Color(0xFF8B8F99),
      outlineVariant:      const Color(0xFF42454D),
      inverseSurface:      const Color(0xFFE6E8EE),
      onInverseSurface:    const Color(0xFF1A1C22),
      inversePrimary:      const Color(0xFF1A6E96),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      textTheme: _buildTextTheme(cs),
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
        scrolledUnderElevation: 2,
        shadowColor: Colors.black38,
        titleTextStyle: TextStyle(
          color: cs.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.3,
        ),
      ),
      navigationBarTheme: _navBarTheme(cs),
      cardTheme: _cardTheme(cs),
      tabBarTheme: _tabBarTheme(cs),
      chipTheme: _chipTheme(cs),
      inputDecorationTheme: _inputTheme(cs),
      elevatedButtonTheme: _elevatedBtn(cs),
      outlinedButtonTheme: _outlinedBtn(cs),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: cs.primary,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      dividerTheme: DividerThemeData(
        color: cs.outlineVariant, thickness: 1, space: 0,
      ),
      iconTheme: IconThemeData(color: cs.onSurfaceVariant, size: 24),
      scaffoldBackgroundColor: surface,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: cs.inverseSurface,
        contentTextStyle: TextStyle(color: cs.onInverseSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: cs.surfaceContainerLow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        showDragHandle: true,
        dragHandleColor: cs.onSurfaceVariant.withValues(alpha: 0.4),
        dragHandleSize: const Size(36, 4),
        elevation: 1,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: cs.secondaryContainer,
        foregroundColor: cs.onSecondaryContainer,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  // ── Shared component themes ──────────────────────────────────────────────

  static NavigationBarThemeData _navBarTheme(ColorScheme cs) =>
      NavigationBarThemeData(
        backgroundColor: cs.surfaceContainerLow,
        indicatorColor: cs.secondaryContainer,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: cs.onSecondaryContainer, size: 24);
          }
          return IconThemeData(color: cs.onSurfaceVariant, size: 24);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: cs.onSurface,
            );
          }
          return TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, color: cs.onSurfaceVariant,
          );
        }),
        elevation: 2,
        shadowColor: Colors.black26,
        height: 72,
        surfaceTintColor: Colors.transparent,
      );

  static CardThemeData _cardTheme(ColorScheme cs) => CardThemeData(
        elevation: 0,
        color: cs.surfaceContainerLow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        clipBehavior: Clip.antiAlias,
      );

  static TabBarThemeData _tabBarTheme(ColorScheme cs) => TabBarThemeData(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicator: UnderlineTabIndicator(
          borderSide: const BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(2),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      );

  static ChipThemeData _chipTheme(ColorScheme cs) => ChipThemeData(
        backgroundColor: cs.surfaceContainerHighest,
        selectedColor: cs.secondaryContainer,
        labelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: cs.onSurface,
        ),
        side: BorderSide(color: cs.outlineVariant),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        showCheckmark: false,
      );

  static InputDecorationTheme _inputTheme(ColorScheme cs) =>
      InputDecorationTheme(
        filled: true,
        fillColor: cs.surfaceContainerLowest,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: cs.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: cs.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: cs.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: cs.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: cs.error, width: 2),
        ),
        labelStyle: TextStyle(color: cs.onSurfaceVariant),
        prefixIconColor: cs.onSurfaceVariant,
        suffixIconColor: cs.onSurfaceVariant,
      );

  static ElevatedButtonThemeData _elevatedBtn(ColorScheme cs) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.1,
          ),
        ),
      );

  static OutlinedButtonThemeData _outlinedBtn(ColorScheme cs) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: cs.onSurfaceVariant,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
          side: BorderSide(color: cs.outlineVariant),
          textStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.1,
          ),
        ),
      );

  // ── Typography — M3 Expressive weight contrast ───────────────────────────
  static TextTheme _buildTextTheme(ColorScheme cs) {
    return TextTheme(
      // Display — hero numerals & big statements (Expressive: w800)
      displayLarge: TextStyle(
        fontSize: 57, fontWeight: FontWeight.w800, color: cs.onSurface,
        letterSpacing: -1.5,
      ),
      displayMedium: TextStyle(
        fontSize: 45, fontWeight: FontWeight.w800, color: cs.onSurface,
        letterSpacing: -1.0,
      ),
      displaySmall: TextStyle(
        fontSize: 36, fontWeight: FontWeight.w700, color: cs.onSurface,
        letterSpacing: -0.5,
      ),
      // Headline — w700
      headlineLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.w700, color: cs.onSurface,
        letterSpacing: -0.25,
      ),
      headlineMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.w700, color: cs.onSurface,
      ),
      headlineSmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w600, color: cs.onSurface,
      ),
      // Title — w600
      titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.w600, color: cs.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: cs.onSurface,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: cs.onSurface,
        letterSpacing: 0.1,
      ),
      // Body — w400 (calm, readable)
      bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: cs.onSurface,
        letterSpacing: 0.15,
      ),
      bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: cs.onSurface,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: cs.onSurfaceVariant,
        letterSpacing: 0.4,
      ),
      // Label — w600 (buttons, chips, nav)
      labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: cs.onSurface,
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w600, color: cs.onSurface,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontSize: 11, fontWeight: FontWeight.w600, color: cs.onSurfaceVariant,
        letterSpacing: 0.5,
      ),
    );
  }
}
