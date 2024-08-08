import 'package:flutter/material.dart';
import 'package:vazifa36/model/contact_model.dart';
import 'package:vazifa36/ui/screen/massage_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ContactModel> contacts = [
    ContactModel(
      contactId: 1,
      contactName: "Jhone",
      contactLastname: "Jhones",
      isOnlie: true,
      imageUrl:
          "https://avatars.mds.yandex.net/i?id=53596c735c1076eccb5ca421a9ebe27ac6fbee29-5333204-images-thumbs&n=13",
      lastOnlineTime: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    ContactModel(
      contactId: 2,
      contactName: "Daniel",
      contactLastname: "Corme",
      isOnlie: false,
      imageUrl:
          "https://avatars.mds.yandex.net/i?id=53596c735c1076eccb5ca421a9ebe27ac6fbee29-5333204-images-thumbs&n=13",
      lastOnlineTime: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    // Add more contacts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversations'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ZoomTapAnimation(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MessageScreen();
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(contacts[index].imageUrl),
                    ),
                    title: Text(contacts[index].contactName),
                    subtitle: Text(contacts[index].contactLastname),
                    trailing: const Text(
                      "11:02 PM",
                      style: TextStyle(color: Colors.grey),
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

  String _formatLastOnlineTime(DateTime lastOnlineTime) {
    final now = DateTime.now();
    final difference = now.difference(lastOnlineTime);
    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else {
      return "${difference.inDays} days ago";
    }
  }
}
