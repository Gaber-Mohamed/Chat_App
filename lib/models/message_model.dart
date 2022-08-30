// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class Message {
  String message;
  String id;
  Message(
    this.message,
    this.id,
  );
factory Message.Fromjson(jsonData){
  return Message(jsonData['message'],jsonData['id']);
}
}
