part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

final class CameraInterviewActionState extends HomeActionState {}

final class StartTalkToAiActionState extends HomeState {}
