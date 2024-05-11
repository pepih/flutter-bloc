import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/presentation/blocs/blocs.dart';

class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.watch<CounterCubit>();
    final usernameCubit = context.watch<UsernameCubit>();
    // final themeCubit = context.watch<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          // Uncomment for using with themeCubit instead of BlocBuilder
          // IconButton(
          //   onPressed: () {
          //     themeCubit.themeToggle();
          //   },
          //   icon: Icon(
          //     themeCubit.state.isDarkMode
          //         ? Icons.light_mode_outlined
          //         : Icons.dark_mode_outlined,
          //     size: 100,
          //   ),
          // ),
          //Uncomment for using with BlocBuilder instead of themeCubit
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: state.isDarkMode
                    ? const Icon(Icons.light_mode_outlined, size: 100)
                    : const Icon(Icons.dark_mode_outlined, size: 100),
                onPressed: () {
                  context.read<ThemeCubit>().themeToggle();
                },
              );
            },
          ),
          Text(usernameCubit.state, style: const TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label: Text(counterCubit.state.toString(),
                style: const TextStyle(fontSize: 100)),
            onPressed: () {
              counterCubit.increment();
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          usernameCubit.setRandomUsername();
        },
      ),
    );
  }
}
