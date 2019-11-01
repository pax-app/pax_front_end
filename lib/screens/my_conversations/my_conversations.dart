import 'package:Pax/components/chat_tile/chat_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class MyConversations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _getUserChats();
    return Container(
      height: MediaQuery.of(context).size.height - 150,
      child: FutureBuilder(
        future: _getUserChats(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ChatTile(
                  chat_id: snapshot.data[index]["chat_id"].toString(),
                  message: 'O serviço vai ficar R\$35,00, posso mandar o Pax?',
                  username: 'Rorgérin Júrnio',
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<dynamic> _getUserChats() async {
    var params = {"user_id": "1"};

    Uri uri = Uri.parse("https://pax-chat.herokuapp.com/chats");
    final newURI = uri.replace(queryParameters: params);

    var response = await http.get(newURI);
    var jsonData = json.decode(response.body);

    final List<dynamic> chats = [];
    for (var item in jsonData) {
      chats.add(item);
    }

    return chats;
  }
}
