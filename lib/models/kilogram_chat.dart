import 'dart:convert';

class KilogramChat {
  int id;
  String title = "";
  String chatType = "";
  String lastMessage = "";
  String profilePic = "";
  int unread_count = 0;
  int date = 0;
  // int order = 0;
  List labels = new List();

  KilogramChat(receivedJson) {
    var _chat = receivedJson['chat'];
    // print(_chat['photo']);
    if (_chat['photo'] != null) {
      if (_chat['photo']['small']['local']['path'] != null) {
        this.profilePic = _chat['photo']['small']['local']['path'];
      }
    }
    this.id = _chat['id'];
    this.chatType = _chat['type']['@type'];
    this.title = _chat['title'];
    // this.order = int.parse(_chat['order']);
    this.unread_count = _chat['unread_count'];

    switch (_chat['type']['@type']) {
      case "chatTypeBasicGroup":
        this.chatType = "chatTypeBasicGroup";
        break;
      case "chatTypePrivate":
        this.chatType = "chatTypePrivate";
        break;
      case "chatTypeSupergroup":
        if (_chat['type']['is_channel'])
          this.chatType = "chatTypeChannel";
        else
          this.chatType = "chatTypeSuperGroup";
        break;
    }
    if (_chat['client_data'] != "") {
      print("===================\nClient Data:");
      print(_chat['client_data']);
      var client_data = json.decode(_chat['client_data']);
      List _labels = client_data['labels'];
      for (String s in _labels) {
        String st = s.trim();
        if (st != "") {
          if (!this.labels.contains(st)) this.labels.add(st);
        }
      }
    }
  }
}
