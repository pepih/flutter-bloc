import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeCubit extends Cubit<bool> {
  ThemeModeCubit() : super(false);

  void setDarkMode() {
    emit(true);
  }

  void setLightMode() {
    emit(false);
  }
}
