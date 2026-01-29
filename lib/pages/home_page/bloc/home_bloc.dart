import 'dart:async';

import 'package:bloc/bloc.dart';
// import 'package:interview_app/pages/mcq_page/screens/my_mcq.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<CameraInterviewButtonClicked>(cameraInterviewButtonClicked);
    on<StartTalkToAiButtonClicked>(startTalkToAiButtonClicked);
    
  }

  FutureOr<void> cameraInterviewButtonClicked(
    CameraInterviewButtonClicked event,
    Emitter<HomeState> emit,
  ) {
    emit(CameraInterviewActionState());
  }

  FutureOr<void> startTalkToAiButtonClicked(
    StartTalkToAiButtonClicked event,
    Emitter<HomeState> emit,
  ) {
    emit(StartTalkToAiActionState());
  }
}


