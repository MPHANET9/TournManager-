import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF1E3A8A);
  static const Color primaryPurple = Color(0xFF7C3AED);
  static const Color primaryIndigo = Color(0xFF4F46E5);

  static const Color soccerGreen = Color(0xFF059669);
  static const Color soccerGreenDark = Color(0xFF047857);

  static const Color combatRed = Color(0xFFDC2626);
  static const Color combatRedDark = Color(0xFFB91C1C);

  static const Color amber = Color(0xFFFBBF24);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Roboto',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: AppColors.white,
    ),
  );
}

class AppConstants {
  static const String appName = 'Tournament Manager';
  static const String soccerSport = 'soccer';
  static const String combatSport = 'combat';

  static const String leagueFormat = 'league';
  static const String knockoutFormat = 'knockout';
  static const String groupKnockoutFormat = 'group-knockout';

  static const String statusUpcoming = 'upcoming';
  static const String statusOngoing = 'ongoing';
  static const String statusCompleted = 'completed';
}
