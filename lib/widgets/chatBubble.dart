import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsetsDirectional.symmetric(vertical: 20,horizontal: 5),

        decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),topRight:   Radius.circular(20))
        ),
        child: const Text(' ahmed ekramy'),
      ),
    );
  }
}