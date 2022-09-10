import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class MyChatPage extends StatefulWidget {
  final MyChatPageArguments arguments;
  const MyChatPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<MyChatPage> createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  String messageContent = "";
  final TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {});
    });
    BlocProvider.of<ChatBloc>(context)
        .add(GetMessagesEvent(channelId: widget.arguments.groupChatId));
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: profileWidget(
                    imageUrl: widget.arguments.peerAvatar,
                    name: widget.arguments.peerNickname),
              ),
            ),
            const SizedBox(width: 15),
            Text(widget.arguments.peerNickname)
          ],
        ),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (index, state) {
          if (state is ChatLoadedState) {
            return Column(
              children: [_messagesListWidget(state), _sendMessageTextField()],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  _showMenu(BuildContext context, Offset tapPos) {
    final RenderBox overlay = context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromLTRB(
      tapPos.dx,
      tapPos.dy,
      overlay.size.width - tapPos.dx,
      overlay.size.height - tapPos.dy,
    );
    showMenu<String>(
        context: context,
        position: position,
        items: <PopupMenuItem<String>>[
          PopupMenuItem(
            child: const Text('Delete Message'),
            onTap: () {
              BlocProvider.of<ChatBloc>(context).add(
                  DeleteTextMessage(channelId: widget.arguments.groupChatId));
            },
          ),
        ]);
  }

  Widget _messagesListWidget(ChatLoadedState messages) {
    _scrollController = ScrollController(initialScrollOffset: 50.0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        Timer(const Duration(milliseconds: 100), () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInQuad,
          );
        });
      }
    });

    return Expanded(
      child: widget.arguments.groupChatId.isNotEmpty
          ? ListView.builder(
              controller: _scrollController,
              itemCount: messages.messages.length,
              itemBuilder: (context, index) {
                final message = messages.messages[index];

                if (message.content!.isNotEmpty) {
                  if (message.senderId == widget.arguments.uid) {
                    return _messageLayout(
                      alignName: TextAlign.end,
                      color: Colors.white,
                      time:
                          DateFormat('hh:mm a').format(message.time!.toDate()),
                      align: TextAlign.left,
                      boxAlign: CrossAxisAlignment.start,
                      crossAlign: CrossAxisAlignment.end,
                      nip: BubbleNip.rightTop,
                      text: message.content,
                    );
                  } else {
                    return _messageLayout(
                      color: Colors.white,
                      alignName: TextAlign.end,
                      time:
                          DateFormat('hh:mm a').format(message.time!.toDate()),
                      align: TextAlign.left,
                      boxAlign: CrossAxisAlignment.start,
                      crossAlign: CrossAxisAlignment.start,
                      nip: BubbleNip.leftTop,
                      text: message.content,
                    );
                  }
                } else {
                  return const Center(child: Text("No message here yet..."));
                }
              },
            )
          : const ErrorDisplay(
              title: 'Error', text: 'Error loading chat. Try again'),
    );
  }

  Widget _messageLayout({
    text,
    time,
    color,
    align,
    boxAlign,
    nip,
    crossAlign,
    // String? name,
    alignName,
  }) {
    var tapPos;
    return InkWell(
      onTapDown: (TapDownDetails details) {
        tapPos = details.globalPosition;
      },
      onLongPress: () {
        _showMenu(context, tapPos);
      },
      child: Column(
        crossAxisAlignment: crossAlign,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.80,
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(3),
              child: Bubble(
                color: color,
                nip: nip,
                child: Column(
                  crossAxisAlignment: crossAlign,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        text,
                        textAlign: align,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Text(
                      time,
                      textAlign: align,
                      style: TextStyle(
                        fontSize: 12,
                        color: blackTextStyle.withOpacity(
                          .4,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _sendMessageTextField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      offset: const Offset(0.0, 0.50),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.insert_emoticon,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 60),
                      child: Scrollbar(
                        child: TextField(
                          style: const TextStyle(fontSize: 14),
                          controller: _messageController,
                          maxLines: null,
                          // autofocus: true,
                          autocorrect: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a message"),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.link,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _messageController.text.isEmpty
                          ? Icon(
                              Icons.camera_alt,
                              color: Colors.grey[500],
                            )
                          : const Text(""),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              if (_messageController.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: 'Nothing to send', backgroundColor: Colors.grey);
              } else {
                BlocProvider.of<ChatBloc>(context).add(SendTextMessageEvent(
                    textMessageEntity: TextMessageEntity(
                        time: Timestamp.now(),
                        senderId: widget.arguments.uid,
                        content: _messageController.text,
                        senderName: widget.arguments.uid,
                        recipientId: widget.arguments.peerId,
                        receiverName: widget.arguments.peerNickname,
                        type: "TEXT"),
                    channelId: widget.arguments.groupChatId));
                BlocProvider.of<MyGroupBloc>(context).add(
                  UpdateDataFirestoreEvent(
                    collectionPath: "groupChatChannel",
                    docPath: widget.arguments.groupChatId,
                    dataNeedUpdate: {"content": _messageController.text},
                  ),
                );
                setState(() {
                  _messageController.clear();
                });
              }
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyChatPageArguments {
  final String peerId;
  final String peerAvatar;
  final String uid;
  final String peerNickname;
  final String groupChatId;

  MyChatPageArguments({
    required this.peerId,
    required this.peerAvatar,
    required this.peerNickname,
    required this.uid,
    required this.groupChatId,
  });
}
