import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String message ;
   String ? messageId;
  final String userId ;
  final String userName ;
  final Timestamp dateTime ;

  Message( this.messageId,{required this.message,required this.userId,required this.userName,required this.dateTime});
}