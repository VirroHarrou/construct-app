import 'package:construct/core/utils/compare_time.dart';
import 'package:construct/domain/entities/chat/message/message.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final ChatMessageResponse messageResponse;
  final ValueSetter<String>? onLongPress;

  const MessageView(this.messageResponse, {super.key, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onLongPress: () {
            if (onLongPress != null) onLongPress!(messageResponse.content);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            constraints: BoxConstraints(
              maxWidth: 335,
            ),
            child: Text(
              messageResponse.content,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: "Inter",
              ),
            ),
          ),
        ),
        Text(
          getComparedTime(messageResponse.createdAt),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: "Inter",
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        )
      ],
    );
  }
}
