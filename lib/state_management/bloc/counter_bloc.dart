import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({int? start}) : super(CounterState(start ?? 0, 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    yield CounterState(this.state.count + 1, -(this.state.count + 1));
  }
}

class CounterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CounterState {
  int count;
  int negativeCount;
  CounterState(this.count, this.negativeCount);
}
