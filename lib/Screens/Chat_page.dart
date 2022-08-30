import 'package:flutter/material.dart';
import 'package:scholar_chat/Constants/Bubble_Chat.dart';
import 'package:scholar_chat/Constants/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/models/message_model.dart';

class ChatPage extends StatelessWidget {
  CollectionReference Messages =
      FirebaseFirestore.instance.collection(kmessagescollection);
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  Widget build(BuildContext context) {
    var Email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: Messages.orderBy('Time', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> ListofMessages = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            ListofMessages.add(Message.Fromjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
              appBar: AppBar(
                actions: [PopupMenuButton(itemBuilder: (context){
                  return [
                    PopupMenuItem<int>(value: 0 ,child: Text('Sign up')),
                  ];
                }, onSelected: (Value){
                  if (Value == 0){
                    Navigator.pop(context);
                  }
                },
                )],
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/scholar.png', height: 50),
                    Text(
                      'Chat',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: ListofMessages.length,
                        itemBuilder: (context, index) {
                          return ListofMessages[index].id == Email
                              ? chatbubblsender(message: ListofMessages[index])
                              : chatbubblreciver(
                                  message: ListofMessages[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        scrollController.animateTo(
                            scrollController.position.minScrollExtent,
                            duration: Duration(microseconds: 1),
                            curve: Curves.fastOutSlowIn);
                        Messages.add({
                          'message': data,
                          'Time': DateTime.now(),
                          'id': Email
                        });
                        controller.clear();
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        suffixIcon: Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        } else {
          return Text('loading....');
        }
      },
    );
  }
}
