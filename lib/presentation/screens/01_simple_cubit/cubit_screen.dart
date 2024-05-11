import 'package:blocs_app/presentation/blocs/01_simple_cubit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
          child: BlocBuilder<UsernameCubit, String>(
        builder: (context, state) => Text(state),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UsernameCubit>().setRandomUsername();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
