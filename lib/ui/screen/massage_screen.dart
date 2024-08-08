import 'package:flutter/material.dart';
import 'package:vazifa36/model/massage_model.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<MessageModel> messages = [
    MessageModel(
      messageId: 1,
      messageText: "Salom qalaysan",
      isFile: false,
      createdTime: DateTime.now().subtract(const Duration(minutes: 1)).toString(),
      contactId: 2,
      status: 5,
    ),
    MessageModel(
      messageId: 2,
      messageText: "Nima gaplar hammasi joyidami",
      isFile: false,
      createdTime:
          DateTime.now().subtract(const Duration(minutes: 5)).toString(),
      contactId: 2,
      status: 5,
    ),
    // Add more messages here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(188, 7, 29, 94),
        centerTitle: true,
        title: const Text(
          "Messages",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isCurrentUser =
                    message.contactId == 1; // Assuming 1 is the current user ID

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: isCurrentUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isCurrentUser ? Colors.blue : Colors.grey.shade300,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: isCurrentUser
                              ? const Radius.circular(16)
                              : const Radius.circular(0),
                          bottomRight: isCurrentUser
                              ? const Radius.circular(0)
                              : const Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.messageText,
                            style: TextStyle(
                              color:
                                  isCurrentUser ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatTime(message.createdTime),
                            style: TextStyle(
                              color: isCurrentUser
                                  ? Colors.white70
                                  : Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes}m ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours}h ago";
    } else {
      return "${difference.inDays}d ago";
    }
  }
}
