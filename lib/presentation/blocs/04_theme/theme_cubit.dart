import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool darkMode = false}) : super(ThemeState(isDarkMode: darkMode));

  void themeToggle() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void darkModeSet() {
    emit(const ThemeState(isDarkMode: true));
  }

  void lightModeSet() {
    emit(const ThemeState(isDarkMode: false));
  }
}
