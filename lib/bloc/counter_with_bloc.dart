import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterWithBloc extends StatelessWidget {
  CounterWithBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Counter With Bloc"),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              'count: ${state.count}',
              style: Theme.of(context).textTheme.headline4,
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().state;
                context.read<CounterBloc>().add(CounterEvent());
              },
              child: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
