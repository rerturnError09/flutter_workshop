import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/pages/talk_to_ai_page/bloc/talk_to_ai_bloc.dart';

class StartTalkToAi extends StatefulWidget {
  const StartTalkToAi({super.key});

  @override
  State<StartTalkToAi> createState() => _StartTalkToAiState();
}

class _StartTalkToAiState extends State<StartTalkToAi> {
  TextEditingController candidateMessage = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = TalkToAiBloc();
        //initializing the chat with welcome message
        bloc.add(ChatStratedEvent());
        return bloc;
      },
      child: BlocConsumer<TalkToAiBloc, TalkToAiState>(
        listenWhen: (previous, current) => current is TalkToAiActionState,
        buildWhen: (previous, current) => current is! TalkToAiActionState,
        listener: (context, state) {
          //TODO: i bring it from builder to listner. motive to make loading instead building whole new screen make it bubble laoding . but 'something went error' is occuring fix it
          if (state is TalkToAiLoadingState) {
            isLoading = true;
          }
        },
        builder: (context, state) {
          if (state is MessageSentSuccessState) {
            isLoading = false;
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  centerTitle: true,
                  title: Center(
                    child: Text(
                      'Chat with AI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.responseMessage.length,
                          itemBuilder: (context, index) {
                            final message = state.responseMessage[index];
                            return Container(
                              alignment: message['isUser']
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 16.0,
                              ),
                              child: Container(
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: message['isUser']
                                      ? Colors.blueAccent
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                padding: EdgeInsets.all(12.0),
                                child: isLoading
                                    ? Text('Loding...')
                                    : Text(
                                        message['text'],
                                        style: TextStyle(
                                          color: message['isUser']
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(horizontal: 10.0),

                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                controller: candidateMessage,
                                decoration: InputDecoration(
                                  hintText: 'Type your message...',
                                  border: OutlineInputBorder(),
                                ),
                                onSubmitted: (value) {
                                  context.read<TalkToAiBloc>().add(
                                    SendButtonTappedEvent(
                                      message: candidateMessage.text,
                                    ),
                                  );
                                  candidateMessage.clear();
                                },
                              ),
                            ),

                            IconButton(
                              icon: Icon(Icons.send),
                              iconSize: 35,
                              onPressed: () => context.read<TalkToAiBloc>().add(
                                SendButtonTappedEvent(
                                  message: candidateMessage.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          //Error handling
          else if (state is TalkToAiErrorState) {
            return Scaffold(
              body: Center(child: Text('Error: ${state.errorMessage}')),
            );
          } else {
            return Scaffold(body: Center(child: Text("something went wrong!")));
          }
        },
      ),
    );
  }
}
