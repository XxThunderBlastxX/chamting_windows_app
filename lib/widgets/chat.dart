import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

const image =
    "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

class Chat extends StatefulWidget {
  String img;

  Chat({Key? key, this.img = image}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          //User Profile Icon
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatMessage(
                width:
                    screenWidth > 600 ? screenWidth * 0.5 : screenWidth * 0.7,
                msg: "hello",
              ),
              ChatMessage(
                width:
                    screenWidth > 600 ? screenWidth * 0.5 : screenWidth * 0.7,
                msg: "works",
              ),
            ],
          ),
          Positioned(
            top:0,
            left: 0,
            child: ProfileIcon(img: widget.img),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.msg, required this.width})
      : super(key: key);
  final String msg;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: width - 30,
      ),
      decoration: BoxDecoration(
          color: material.Colors.grey.shade800,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      // width: 500,
      child: Text(
        msg,
        softWrap: true,
        overflow: TextOverflow.visible,
        maxLines: 20,
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        child: Image(
          image: NetworkImage(img),
          height: 37,
          width: 37,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
