import 'package:construct/core/utils/compare_time.dart';
import 'package:construct/domain/entities/chat/message/message.dart';
import 'package:construct/generated/l10n.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final ChatMessageResponse messageResponse;
  final Widget? header;
  final bool showTime;
  final ValueSetter<String>? onLongPress;
  final bool isMe;

  const MessageView(
    this.messageResponse, {
    required this.isMe,
    super.key,
    this.header,
    this.showTime = false,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onLongPress: onLongPress != null
              ? () => onLongPress!(messageResponse.content)
              : null,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            constraints: const BoxConstraints(
              maxWidth: 335,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (header != null) ...[
                  header!,
                  const SizedBox(height: 5),
                ],
                SelectableText(
                  messageResponse.content,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Inter",
                  ),
                ),
                if (messageResponse.isEdited) ...[
                  Text(
                    "изменено",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
        if (showTime) ...[
          const SizedBox(height: 10),
          Text(
            getComparedTime(messageResponse.createdAt, S.of(context)),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontFamily: "Inter",
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ],
    );
  }
}
