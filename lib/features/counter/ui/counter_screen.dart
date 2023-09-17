import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_example/features/counter/bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CounterBloc, int>(
        bloc: counterBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Text(
              '$state',
              style: const TextStyle(color: Colors.black, fontSize: 30.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              counterBloc.add(CounterIncrementEvent());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              counterBloc.add(CounterDecrementEvent());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.delete_forever),
            onPressed: () => HydratedBloc.storage.clear(),
          ),
        ],
      ),
    );
  }
}
