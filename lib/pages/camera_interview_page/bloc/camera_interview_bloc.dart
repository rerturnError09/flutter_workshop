import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:interview_app/pages/camera_interview_page/models/gemini_response_model.dart';
import 'package:interview_app/pages/camera_interview_page/repo/gemini_repo.dart';

import 'package:meta/meta.dart';
part 'camera_interview_event.dart';
part 'camera_interview_state.dart';

class CameraInterviewBloc
    extends Bloc<CameraInterviewEvent, CameraInterviewState> {
  CameraInterviewBloc() : super(CameraInterviewInitial()) {
    on<CameraInterviewInitialEvent>(cameraInterviewInitialEvent);
    on<StartCameraInterviewButtonTappedEvent>(
      startCameraInterviewButtonTappedEvent,
    );
  }

  FutureOr<void> startCameraInterviewButtonTappedEvent(
    StartCameraInterviewButtonTappedEvent event,
    Emitter<CameraInterviewState> emit,
  ) async {
    emit(CameraInterviewLoadingState());
    final Post geminiResponse = await GeminiRepository().getResponse();
    emit(CameraInterviewLoadingSuccessState(geminiResponse: geminiResponse));
    
  }

  FutureOr<void> cameraInterviewInitialEvent(
    CameraInterviewInitialEvent event,
    Emitter<CameraInterviewState> emit,
  ) {
    emit(CameraInterviewInitial());
  }
}
