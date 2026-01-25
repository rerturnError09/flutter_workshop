import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/pages/camera_interview_page/bloc/camera_interview_bloc.dart';
import 'package:interview_app/pages/camera_interview_page/ui/mobile_ui/initial_mobile_ui.dart';
import 'package:interview_app/pages/camera_interview_page/ui/mobile_ui/loading_success_mobile_ui.dart';

class MobileUi extends StatelessWidget {
  const MobileUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraInterviewBloc, CameraInterviewState>(
      listenWhen: (previous, current) => current is CameraInterviewActionState,
      buildWhen: (previous, current) => current is! CameraInterviewActionState,
      listener: (context, state) {},
      builder: (context, state) {
        //loading
        if (state is CameraInterviewLoadingState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        //loading error
        else if (state is CameraInterviewLoadingErrorState) {
          return Scaffold(body: Center(child: Text('loading Error')));
        }
        //loading success
        else if (state is CameraInterviewLoadingSuccessState) {
          return LoadingSuccessMobileUi(
            state: state,
          );
        }
        //inital view
        else if (state is CameraInterviewInitial) {
          return InitialMobileUi();
        }
        //if no state matches or wrong state is emitted
        else {
          return Scaffold(body: Center(child: Text('state not matched Error')));
        }
      },
    );
  }
}
