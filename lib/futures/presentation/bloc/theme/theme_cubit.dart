import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/config/app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final ThemeData initialTheme;

  ThemeCubit({required this.initialTheme}) : super(initialTheme);

  void switchTheme() {
    state == AppThemes.lightTheme
        ? emit(AppThemes.darkTheme)
        : emit(AppThemes.lightTheme);
  }
}
