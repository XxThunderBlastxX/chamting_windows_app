import 'package:agora_rtc_engine/rtc_remote_view.dart' as remoteView;
import 'package:agora_vc_windows/widgets/chat.dart';
import 'package:fluent_ui/fluent_ui.dart';

Widget? renderRemotePreview(int? remoteUid) {
  // var cons = Provider.of<Const>(context);


  return Row(
    children: [
      Chat()
    ],
  );














  if (remoteUid != null) {
    return remoteView.SurfaceView(
      uid: remoteUid,
    );
  } else {
    return const Center(
      child: Text('Waiting For other Person to Join'),
    );
  }

  return null;
}
