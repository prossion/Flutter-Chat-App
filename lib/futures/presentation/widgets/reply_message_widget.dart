import 'package:flutter/material.dart';
import 'package:flutter_social_app/futures/domain/entites/text_message_entity.dart';

class ReplyMessageWidget extends StatelessWidget {
  final TextMessageEntity replyMessage;
  final VoidCallback? onCancelReply;
  final String name;

  const ReplyMessageWidget({
    Key? key,
    required this.replyMessage,
    this.onCancelReply,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                      if (onCancelReply != null)
                        GestureDetector(
                          onTap: onCancelReply,
                          child: const Icon(Icons.close, size: 16),
                        )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${replyMessage.content}',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
