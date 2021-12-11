import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_model.dart';

class CounterWithProvider extends StatelessWidget {
  CounterWithProvider({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Counter With Provider"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Consumer<CounterModel>(
                builder: (context, bloc, child) {
                  return Text(
                    'consumer ${bloc.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Builder(builder: (context) {
                return Text(
                  'watch: ${context.watch<CounterModel>().counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              })
            ],
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () => context.read<CounterModel>().incrementCounter(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
