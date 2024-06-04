import 'package:app_mensajeria/domain/models/Chat/chat.dart';
import 'package:app_mensajeria/domain/models/Chat/repository/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<List<ChatModel>> getAllChats() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await firestore.collection('chats').get();
      return querySnapshot.docs.map((doc) {
        return ChatModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("Failed to load chats: $e");
    }
  }
}
