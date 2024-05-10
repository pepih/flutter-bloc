import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<ThemeModeCubit, bool>(
            builder: (context, state) {
              return IconButton(
                icon: state
                    ? const Icon(Icons.light_mode_outlined, size: 100)
                    : const Icon(Icons.dark_mode_outlined, size: 100),
                onPressed: () {
                  state
                      ? context.read<ThemeModeCubit>().setLightMode()
                      : context.read<ThemeModeCubit>().setDarkMode();
                },
              );
            },
          ),
          Text(context.watch<UsernameCubit>().state.toString(),
              style: const TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label: Text(context.watch<CounterCubit>().state.toString(),
                style: const TextStyle(fontSize: 100)),
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          context
              .read<UsernameCubit>()
              .setUsername(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}
