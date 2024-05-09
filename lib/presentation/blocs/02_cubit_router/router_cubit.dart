import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:blocs_app/config/config.dart';

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(appRouter);

  void goBack() {
    state.pop();
  }

  void goHome() {
    state.go("/");
  }
}
