import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/entites/text_message_entity.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/reply_message_widget.dart';

class TextMessageLayout extends StatelessWidget {
  const TextMessageLayout(
      {Key? key,
      required this.text,
      required this.time,
      required this.color,
      required this.align,
      required this.boxAlign,
      required this.nip,
      required this.crossAlign,
      required this.name,
      required this.alignName,
      required this.groupId,
      required this.replyingMessage})
      : super(key: key);
  final String? text;
  final String time;
  final Color color;
  final TextAlign align;
  final CrossAxisAlignment boxAlign;
  final BubbleNip nip;
  final CrossAxisAlignment crossAlign;
  final String? name;
  final TextAlign alignName;
  final String groupId;
  final TextMessageEntity? replyingMessage;

  @override
  Widget build(BuildContext context) {
    Offset? tapPos;
    return replyingMessage == null
        ? InkWell(
            onTapDown: (TapDownDetails details) {
              tapPos = details.globalPosition;
            },
            onLongPress: () {
              _showMenu(context, tapPos!);
            },
            child: Column(
              crossAxisAlignment: crossAlign,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.90,
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
                          Text(
                            "$name",
                            textAlign: alignName,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              text!,
                              textAlign: align,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            time,
                            textAlign: align,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : Column(
            children: [
              buildReplyMessage(),
              InkWell(
                onTapDown: (TapDownDetails details) {
                  tapPos = details.globalPosition;
                },
                onLongPress: () {
                  _showMenu(context, tapPos!);
                },
                child: Column(
                  crossAxisAlignment: crossAlign,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.90,
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
                              Text(
                                "$name",
                                textAlign: alignName,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  text!,
                                  textAlign: align,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              Text(
                                time,
                                textAlign: align,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
  }

  Widget buildReplyMessage() {
    final replyMessage = replyingMessage;
    final isReplying = replyMessage != null;

    if (!isReplying) {
      return Container();
    } else {
      return ReplyMessageWidget(
        replyMessage: replyMessage,
        name: name!,
      );
    }
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
            BlocProvider.of<ChatBloc>(context)
                .add(DeleteTextMessage(channelId: groupId));
          },
        ),
      ],
    );
  }
}
