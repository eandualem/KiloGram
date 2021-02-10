import 'package:kilogram/models/kilogram_chat.dart';

class KilogramChats {
  List<KilogramChat> _chats = new List<KilogramChat>();

  KilogramChat get(int i) {
    return _chats[i];
  }
  int getSize() {
    return _chats.length;
  }
  void addChat(KilogramChat chat) {
    print('\nchat.id // =>>>> ${chat.id}');

    int _chatExist = 0;
    for (int i = 0; i < _chats.length; i++) {
      if (_chats[i].id == chat.id) {
        _chatExist = 1;
        _chats[i] = chat;
        return;
      }
    }
    if (_chatExist == 0) {
      _chats.add(chat);
    }
  }


  void updateLastMessage(recJson) {
    for (int i = 0; i < _chats.length; i++) {
      if (_chats[i].id == recJson['chat_id']) {
        if (recJson['last_message'] == null) {
          return;
        }
        var timestamp = DateTime.fromMicrosecondsSinceEpoch((recJson['last_message']['date'] * 1000));
        try {
          if (recJson['last_message']['content'] != null &&
              recJson['last_message']['content']['text'] != null &&
              recJson['last_message']['content']['text']['text'] != null)
            _chats[i].lastMessage = (recJson['last_message']['content']['text']['text']);
        } catch (e) {
          print("last_message: " + e);
        }
        break;
      }
    }
  }


}