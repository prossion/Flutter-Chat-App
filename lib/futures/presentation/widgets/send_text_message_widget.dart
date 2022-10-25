import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/domain/entites/text_message_entity.dart';
import 'package:flutter_social_app/futures/presentation/bloc/chat/chat_bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/reply_message_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendMessageTextWidget extends StatefulWidget {
  const SendMessageTextWidget(
      {Key? key,
      required this.getImage,
      required this.messageFunc,
      required this.controller,
      required this.replyMessage,
      required this.name,
      required this.onCancelReply,
      required this.content,
      required this.senderId,
      required this.channelId,
      required this.receiverName,
      required this.receiverId,
      required this.replyName})
      : super(key: key);
  final Function getImage;
  final Function messageFunc;
  final TextEditingController controller;
  final String? replyMessage;
  final String name;
  final VoidCallback onCancelReply;
  final String content;
  final String senderId;
  final String channelId;
  final String receiverName;
  final String receiverId;
  final String replyName;
  @override
  State<SendMessageTextWidget> createState() => _SendMessageTextWidgetState();
}

class _SendMessageTextWidgetState extends State<SendMessageTextWidget> {
  static const inputBottomRadius = Radius.circular(24);

  @override
  Widget build(BuildContext context) {
    final isReplying = widget.replyMessage != null;
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 7, right: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      offset: const Offset(0.0, 0.60),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]),
              child: Column(
                children: [
                  if (isReplying) buildReply(),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          widget.getImage();
                        },
                        icon: const Icon(Icons.link),
                        color: Theme.of(context).bottomAppBarColor,
                        padding: const EdgeInsets.all(0),
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
                              controller: widget.controller,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.only(
                                    topLeft: isReplying
                                        ? Radius.zero
                                        : inputBottomRadius,
                                    topRight: isReplying
                                        ? Radius.zero
                                        : inputBottomRadius,
                                    bottomLeft: inputBottomRadius,
                                    bottomRight: inputBottomRadius,
                                  ),
                                ),
                                hintText: "Type a message",
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Icon(
                      //       Icons.link,
                      //       color: Colors.grey[500],
                      //     ),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     _messageController.text.isEmpty
                      //         ? Icon(
                      //             Icons.camera_alt,
                      //             color: Colors.grey[500],
                      //           )
                      //         : const Text(""),
                      //   ],
                      // ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
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
              if (widget.controller.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: 'Nothing to send', backgroundColor: Colors.grey);
              } else {
                FocusScope.of(context).unfocus();
                widget.onCancelReply();

                BlocProvider.of<ChatBloc>(context)
                    .add(ChatEvent.sendTextMessage(
                  textMessageEntity: TextMessageEntity(
                    time: Timestamp.now(),
                    senderId: widget.senderId,
                    content: widget.content,
                    senderName: widget.name,
                    receiverName: widget.receiverName,
                    recipientId: widget.receiverId,
                    type: "TEXT",
                    replyingMessage: widget.replyMessage,
                  ),
                  channelId: widget.channelId,
                ));
                widget.messageFunc();
                setState(() {
                  widget.controller.clear();
                });
              }
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: const Icon(
                Icons.send,
                color: whiteTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildReply() => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor.withOpacity(0.10),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ReplyMessageWidget(
          replyMessage: widget.replyMessage!,
          name: widget.replyName,
          onCancelReply: widget.onCancelReply,
          textAlign: TextAlign.start,
          align: TextAlign.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      );
}
