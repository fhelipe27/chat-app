import 'package:chatapp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  // pega a instancia do auth e do firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // manda a mensagem
  Future<void> sendMessage(String receiverId, String message) async {
    // pega a informação do usuario atual
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    // cria uma nova mensagem
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      timestamp: timestamp,
      message: message,
    );

    // constroi id do chat room a partir do id do usuario atual e do id do usuario que recebe (ordenado para garantir que seja unico)
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // ordena os ids (isso garante que o id do chat room sempre é o mesmo para qualquer par de pessoas)
    String chatRoomId = ids.join(
        "_"); // combine the ids into a single string to use as a chatroomID

    // adiciona uma nova mensagem no database
    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // GET MESSAGES
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // constroi o id do chat room a partir do id dos usuarios (ordenado para garantir que combine o id usado quando a mensagem está sendo enviada)
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
