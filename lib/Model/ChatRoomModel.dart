import 'package:talksync/Model/ChatModel.dart';
import 'package:talksync/Model/UserModel.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? receiver;
  List<ChatModel>? messages;
  int? unReadMsgNo;
  String? lastMessage;
  String? lastMessageTimestamp;
  String? timestamp;

  ChatRoomModel(
      {this.id,
      this.sender,
      this.receiver,
      this.messages,
      this.unReadMsgNo,
      this.lastMessage,
      this.lastMessageTimestamp,
      this.timestamp});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["sender"] is Map) {
      sender =
          json["sender"] == null ? null : UserModel.fromJson(json["sender"]);
    }
    if (json["receiver"] is Map) {
      receiver = json["receiver"] == null
          ? null
          : UserModel.fromJson(json["receiver"]);
    }
    if (json["messages"] is List) {
      messages = json["messages"] ?? [];
    }
    if (json["unReadMsgNo"] is int) {
      unReadMsgNo = json["unReadMsgNo"];
    }
    if (json["lastMessage"] is String) {
      lastMessage = json["lastMessage"];
    }
    if (json["lastMessageTimestamp"] is String) {
      lastMessageTimestamp = json["lastMessageTimestamp"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if (sender != null) {
      _data["sender"] = sender?.toJson();
    }
    if (receiver != null) {
      _data["receiver"] = receiver?.toJson();
    }
    if (messages != null) {
      _data["messages"] = messages;
    }
    _data["unReadMsgNo"] = unReadMsgNo;
    _data["lastMessage"] = lastMessage;
    _data["lastMessageTimestamp"] = lastMessageTimestamp;
    _data["timestamp"] = timestamp;
    return _data;
  }
}
