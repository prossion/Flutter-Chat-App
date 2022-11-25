import 'package:flutter/material.dart';

class ReplyMessageWidget extends StatelessWidget {
  final String replyMessage;
  final VoidCallback? onCancelReply;
  final String name;
  final TextAlign textAlign;
  final TextAlign align;
  final CrossAxisAlignment crossAxisAlignment;

  const ReplyMessageWidget(
      {Key? key,
      required this.replyMessage,
      this.onCancelReply,
      required this.name,
      required this.textAlign,
      required this.align,
      required this.crossAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).bottomAppBarColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
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
                    replyMessage.length > 20
                        ? '${replyMessage.substring(0, 20)}...'
                        : replyMessage,
                    textAlign: align,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
