import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'talk_to_ai_event.dart';
part 'talk_to_ai_state.dart';

class TalkToAiBloc extends Bloc<TalkToAiEvent, TalkToAiState> {
  TalkToAiBloc() : super(TalkToAiInitial()) {
    on<TalkToAiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
