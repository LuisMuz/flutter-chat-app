import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String senderId;
  final String receiverId;
  final String senderEmail;
  final Timestamp time;

  Message(
      {required this.message,
      required this.senderId,
      required this.receiverId,
      required this.senderEmail,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'time': time
    };
  }
}
