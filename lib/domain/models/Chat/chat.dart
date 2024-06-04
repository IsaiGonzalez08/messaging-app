import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String id;
  final String name;
  final String lastname;
  final String lastMessage;
  final DateTime timestamp;

  ChatModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.lastMessage,
    required this.timestamp,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      lastMessage: json['lastMessage'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'lastMessage': lastMessage,
      'timestamp': timestamp,
    };
  }
}
