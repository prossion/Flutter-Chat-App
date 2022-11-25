import 'dart:async';
import 'dart:io';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:swipe_to/swipe_to.dart';

class MessagesListWidget extends StatelessWidget {
  const MessagesListWidget(
      {Key? key,
      required this.messages,
      required this.controller,
      required this.image,
      required this.userId,
      required this.groupId,
      required this.onSwipedMessage,
      this.name})
      : super(key: key);
  final List<TextMessageEntity> messages;
  final ScrollController controller;
  final File? image;
  final String userId;
  final String groupId;
  final ValueChanged<String> onSwipedMessage;
  final String? name;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 100), () {
      controller.animateTo(
        controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInQuad,
      );
    });
    return Expanded(
      child: ListView.builder(
        controller: controller,
        itemCount: messages.length,
        itemBuilder: (_, index) {
          final message = messages[index];

          if (message.senderId == userId) {
            return message.type == "TEXT"
                ? SwipeTo(
                    onLeftSwipe: () => onSwipedMessage(message.content!),
                    child: TextMessageLayout(
                      text: message.content,
                      time:
                          DateFormat('hh:mm a').format(message.time!.toDate()),
                      color: Theme.of(context).cardColor,
                      align: TextAlign.left,
                      boxAlign: CrossAxisAlignment.start,
                      nip: BubbleNip.rightTop,
                      crossAlign: CrossAxisAlignment.end,
                      name: name ?? "${message.senderName}",
                      alignName: TextAlign.end,
                      groupId: groupId,
                      replyingMessage: message.replyingMessage,
                      messageId: message.messageId,
                      replyingName: message.senderId == userId ? 'Me' : name,
                      // TODO: Need to fix this bug to show real name
                    ),
                  )
                : ImageMessageLayout(
                    imageUrl: message.content!,
                    align: TextAlign.left,
                    alignName: TextAlign.end,
                    boxAlign: CrossAxisAlignment.start,
                    color: Theme.of(context).cardColor,
                    crossAlign: CrossAxisAlignment.end,
                    nip: BubbleNip.rightTop,
                    time: DateFormat('hh:mm a').format(message.time!.toDate()),
                    name: "Me",
                    image: image);
          } else {
            return message.type == "TEXT"
                ? SwipeTo(
                    onLeftSwipe: () => onSwipedMessage(message.content!),
                    child: TextMessageLayout(
                      text: message.content,
                      time:
                          DateFormat('hh:mm a').format(message.time!.toDate()),
                      color: Theme.of(context).cardColor,
                      align: TextAlign.left,
                      boxAlign: CrossAxisAlignment.start,
                      nip: BubbleNip.leftTop,
                      crossAlign: CrossAxisAlignment.start,
                      name: name ?? "${message.senderName}",
                      alignName: TextAlign.end,
                      groupId: groupId,
                      replyingMessage: message.replyingMessage,
                      messageId: message.messageId,
                      replyingName: userId == message.senderId
                          ? name
                          : message.senderName,
                      // TODO: Need to fix this bug to show real name
                    ),
                  )
                : ImageMessageLayout(
                    imageUrl: message.content!,
                    align: TextAlign.left,
                    alignName: TextAlign.end,
                    boxAlign: CrossAxisAlignment.start,
                    color: Theme.of(context).cardColor,
                    crossAlign: CrossAxisAlignment.start,
                    nip: BubbleNip.leftTop,
                    time: DateFormat('hh:mm a').format(message.time!.toDate()),
                    name: name ?? "${message.senderName}",
                    image: image,
                  );
          }
        },
      ),
    );
  }
}
