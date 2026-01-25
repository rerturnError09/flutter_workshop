part of 'camera_interview_bloc.dart';

@immutable
sealed class CameraInterviewEvent {}

class CameraInterviewInitialEvent extends CameraInterviewEvent{}

class StartCameraInterviewButtonTappedEvent extends CameraInterviewEvent {}
