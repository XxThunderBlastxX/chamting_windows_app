import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import './chat_screen.dart';
import '../provider/constants.dart';
import '../widgets/windowButtons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //Page Route
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var cons = Provider.of<Const>(context);
    return NavigationView(
      contentShape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.7,
          color: Colors.green,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28.0),
        ),
      ),
      appBar: NavigationAppBar(
        // backgroundColor: const Color.fromRGBO(161, 208, 0, 0.5),
        // backgroundColor: Color,
        title: () {
          if (kIsWeb) return Text(cons.appName.toString());
          return MoveWindow(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                cons.appName.toString(),
                style: const TextStyle(fontSize: 13),
              ),
            ),
          );
        }(),
        actions: kIsWeb
            ? null
            : MoveWindow(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [Spacer(), WindowButtons()],
                ),
              ),
        automaticallyImplyLeading: false,
      ),
      pane: NavigationPane(
        autoSuggestBox: AutoSuggestBox(
          trailingIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(FluentIcons.search),
          ),
          placeholder: 'Search your Friend',
          controller: TextEditingController(),
          items: const ['Person 1', 'Person 2', 'Person 3', 'Person 4'],
        ),
        displayMode: PaneDisplayMode.auto,
        selected: cons.navigationPaneIndex,
        // onChanged: (i) => setState(() => index = i),
        items: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.chat_bot),
            title: const Text('1st Person'),
            infoBadge: const InfoBadge(
              source: Text('4'),
            ),
          ),
        ],
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
          ),
        ],
      ),
      content: NavigationBody(
        index: 0,
        children: const [
          ChatScreen(),
        ],
      ),
    );
  }
}
