import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterWithMultiBloc extends StatelessWidget {
  final CounterBloc farthestCounterBloc;
  CounterWithMultiBloc({Key? key})
      : farthestCounterBloc = CounterBloc(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: farthestCounterBloc,
      child: BlocProvider(
        create: (context) => CounterBloc(start: 1),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Counter With MultiBloc"),
          ),
          body: Column(
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    'nearest count: ${state.count}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              BlocBuilder<CounterBloc, CounterState>(
                bloc: farthestCounterBloc,
                builder: (context, state) {
                  return Text(
                    'farthest count: ${state.count}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              BlocListener<CounterBloc, CounterState>(
                listener: (context, state) => print("${state.count}"),
                child: Container(),
              )
            ],
          ),
          floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterEvent());
                },
                child: Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}
