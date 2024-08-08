import 'package:flutter/material.dart';
import 'package:vazifa36/model/contact_model.dart';
import 'package:vazifa36/ui/screen/massage_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [
    ContactModel(
      contactId: 1,
      contactName: "Tommy",
      contactLastname: "Washington",
      isOnlie: true,
      imageUrl:
          "https://i.pinimg.com/originals/a9/07/50/a90750dfaf62b628428234ea33b74a90.jpg",
      lastOnlineTime: DateTime.now(),
    ),
    ContactModel(
      contactId: 2,
      contactName: "Tobby",
      contactLastname: "Jefersn",
      isOnlie: false,
      imageUrl: "https://pngimg.com/uploads/ironman/ironman_PNG66.png",
      lastOnlineTime: DateTime.now(),
    ),
    ContactModel(
      contactId: 3,
      contactName: "Jonyy",
      contactLastname: "Freak",
      isOnlie: false,
      imageUrl:
          "https://image.api.playstation.com/vulcan/ap/rnd/202009/3021/B2aUYFC0qUAkNnjbTHRyhrg3.png",
      lastOnlineTime: DateTime.now(),
    ),
  ];

  late List<ContactModel> filteredContacts;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredContacts = List.from(contacts);
    searchController.addListener(_filterContacts);
  }

  void _filterContacts() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredContacts = contacts.where((contact) {
        final fullName =
            '${contact.contactName} ${contact.contactLastname}'.toLowerCase();
        return fullName.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search Contacts',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contact.imageUrl),
                  ),
                  title:
                      Text("${contact.contactName} ${contact.contactLastname}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(contact: contact),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}