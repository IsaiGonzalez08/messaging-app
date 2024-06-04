import 'package:app_mensajeria/domain/models/User/user.dart';
import 'package:app_mensajeria/presentation/providers/chat_provider.dart';
import 'package:app_mensajeria/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyListChatsScreen extends StatelessWidget {
  const MyListChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late UserModel user;
    user = Provider.of<UserProvider>(context, listen: false).userData;
    final name = user.name;
    final lastname = user.lastname;

    String getInitials(String firstName, String lastName) {
      String firstInitial = firstName.isNotEmpty ? firstName[0] : '';
      String lastInitial = lastName.isNotEmpty ? lastName[0] : '';
      return '$firstInitial$lastInitial';
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Chat',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF404040)),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFF01142B),
                  child: Consumer<UserProvider>(
                    builder: (context, userData, child) {
                      String initials = getInitials(name, lastname);
                      return Text(initials,
                          style: const TextStyle(
                              fontSize: 36, color: Color(0xFFFFFFFF)));
                    },
                  ),
                )
              ],
            ),
            const Divider(
              height: 30,
              thickness: 0,
              indent: 0,
              endIndent: 0,
              color: Color(0xFF797979),
            ),
            Consumer<ChatProvider>(builder: (_, controller, __) {
              final chats = controller.chatData;
              return ListView.builder(
                itemBuilder: (_, index) {
                  final chat = chats[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.07,
                          left: MediaQuery.of(context).size.width * 0.07),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: const Color(0xFFF5F5F5),
                        width: 2,
                      )),
                      height: 80,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: const Color(0xFF01142B),
                                child: Consumer<UserProvider>(
                                  builder: (context, userData, child) {
                                    String initials =
                                        getInitials(chat.name, chat.lastname);
                                    return Text(initials,
                                        style: const TextStyle(
                                            fontSize: 36,
                                            color: Color(0xFFFFFFFF)));
                                  },
                                ),
                              ),
                              Column(
                                children: [
                                  Text('${chat.name} ${chat.lastname}'),
                                  Text(chat.lastMessage)
                                ],
                              )
                            ],
                          ),
                          Text(chat.timestamp.toString())
                        ],
                      ),
                    ),
                  );
                },
                itemCount: chats.length,
              );
            })
          ],
        ),
      ),
    );
  }
}
