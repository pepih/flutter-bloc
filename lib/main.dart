import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';

void main() {
  runApp(const BlocsProvider());
}

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsernameCubit()),
        BlocProvider(create: (context) => RouterCubit())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: false).getTheme(),
    );
  }
}
