import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'camera_interview_event.dart';
part 'camera_interview_state.dart';

class CameraInterviewBloc extends Bloc<CameraInterviewEvent, CameraInterviewState> {
  CameraInterviewBloc() : super(CameraInterviewInitial()) {
    on<CameraInterviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
