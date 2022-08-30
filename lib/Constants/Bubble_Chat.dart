import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/Constants/Constants.dart';
import 'package:scholar_chat/models/message_model.dart';
// container bubble chat :- 
class chatbubblsender extends StatelessWidget{
  Message message;
  chatbubblsender({required this.message}) ;
   Widget build(BuildContext context) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35))),
                    margin: EdgeInsets.only(top: 5, right: 50, left: 8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Text(
                        message.message,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
                
                 
                 
                    
                  }
}
class chatbubblreciver extends StatelessWidget{
  Message message;
  chatbubblreciver({required this.message}) ;
   Widget build(BuildContext context) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0XFF006D84),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35),
                            bottomLeft: Radius.circular(35))),
                    margin: EdgeInsets.only(top: 5, right: 8, left: 50),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Text(
                        message.message,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
                
                 
                 
                    
                  }
}
// bubble widget
             //  Bubble(
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 5 , top : 5,bottom: 5),
                //     child: Text(
                //       'how are you ',
                //       style: TextStyle(
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                //   color: kPrimaryColor,
                //   nip: BubbleNip.rightTop,
                //   margin: BubbleEdges.only(top: 20,left: 60),
                //   alignment: Alignment.centerRight,
                //   radius:Radius.circular(15) ,
                //   nipHeight: 10,
                //   nipWidth: 15,
                // );
