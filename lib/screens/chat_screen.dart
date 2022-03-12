import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_vc_windows/widgets/chat.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/localPreview.dart';
import '../widgets/renderRemotePreview.dart';

const appId = "";

const token = "";

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int? _remoteUid;
  RtcEngine? _engine;

  @override
  void initState() {
    initForAgora();
    super.initState();
  }

  Future<void> initForAgora() async {
    //Created an Agora Engine
    _engine = await RtcEngine.createWithConfig(
      RtcEngineConfig(appId),
    );
    await _engine!.enableVideo();
    _engine!.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid: joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid: joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid: offline");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );
    _engine!.joinChannel(token, "chamtingChannel", null, 0);
  }

  void chatButton(String type) {}
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: PageHeader(
          leading: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              child: Icon(FluentIcons.chat_bot),
            ),
          ),
          title: const Text('Person 1'),
          commandBar: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Button(
                  onPressed: () => chatButton('chat'),
                  child: Row(
                    children: const [
                      Icon(Icons.question_answer),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Chat')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Button(
                  onPressed: () => chatButton('videoCall'),
                  child: Row(
                    children: const [
                      Icon(Icons.video_call),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Video Call'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Button(
                  onPressed: () => chatButton('voiceCall'),
                  child: Row(
                    children: const [
                      Icon(Icons.call),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Voice Call'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      content: Mica(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(children: [Chat(), Chat(), Chat()]),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextBox(
                onSubmitted: (String  text){
                  print(text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
