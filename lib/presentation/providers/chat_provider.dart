import 'package:app_mensajeria/domain/models/Chat/chat.dart';
import 'package:app_mensajeria/domain/models/Chat/repository/chat_repository.dart';
import 'package:app_mensajeria/infrastructure/repositories/Chat/chat_repository_impl.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepository _chatRepository = ChatRepositoryImpl();
  late List<ChatModel> _chat;

  List<ChatModel> get chatData => _chat;

  Future<void> loginUser(String email, String password) async {
    List<ChatModel> chatData = await _chatRepository.getAllChats();
    _chat = chatData;
    notifyListeners();
  }
}
