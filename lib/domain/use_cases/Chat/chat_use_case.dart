import 'package:app_mensajeria/domain/models/Chat/chat.dart';
import 'package:app_mensajeria/domain/models/Chat/repository/chat_repository.dart';

class GetAllChatsUseCase {
  final ChatRepository _chatRepository;
  GetAllChatsUseCase(this._chatRepository);

  Future<List<ChatModel>> userLogin(String email, String password) async {
    return await _chatRepository.getAllChats();
  }
}