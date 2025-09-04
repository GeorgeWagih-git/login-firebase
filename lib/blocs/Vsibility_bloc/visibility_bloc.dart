import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityEvent {
  bool state;
  VisibilityEvent({required this.state});
}

class VisibilityBloc extends Bloc<VisibilityEvent, bool> {
  VisibilityBloc() : super(false) {
    on<VisibilityEvent>((event, emit) {
      emit(!event.state);
    });
  }
}
