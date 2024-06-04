import 'package:app_mensajeria/domain/models/Chat/chat.dart';

abstract class ChatRepository {
  Future<List<ChatModel>> getAllChats();
}
