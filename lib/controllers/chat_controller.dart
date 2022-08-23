import 'package:attendance/moduls/message_modul.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  List<Message> messagesList = [];
  // List<> allcondantedList = [];

  Future<void> addMessage(Message message) async {
    debugPrint('addMessage called!');
    FirebaseFirestore.instance.collection('chat').add({
      'message': message.message,
      'userId': message.userId,
      'userName' : message.userName,
      'time' : message.dateTime
    });
  }

  Future<List<Message>> fetchMessage() async {
    debugPrint('fetchMessage called!');
    final QuerySnapshot<Map<String, dynamic>> querySnapshotMessage =
        await FirebaseFirestore.instance.collection('chat').get();
    for (var message in querySnapshotMessage.docs) {
      final messageData = await FirebaseFirestore.instance
          .collection('chat')
          .doc(message.id)
          .get();
      if (messagesList.any((element) => element.messageId == message.id)) {
        messagesList[messagesList
                .indexWhere((element) => element.messageId == message.id)] =
            Message(message.id,
                message: messageData['message'],
                userId: messageData['userId'],
                userName: messageData['userName'],
                dateTime: messageData['time']);
      }else{
        messagesList.add(Message(message.id,
            message: messageData['message'],
            userId: messageData['userId'],
            userName: messageData['userName'],
            dateTime: messageData['time']));
      }


      debugPrint('messagesList length >  ' + messagesList.length.toString());
    }

    return messagesList;
  }
}
