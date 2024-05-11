import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super("no-username");

  void setUsername(String username) {
    emit(username);
  }

  void setRandomUsername() {
    emit(RandomGenerator.getRandomName());
  }
}
