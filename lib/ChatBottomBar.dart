import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.black38,
                    size: 30,
                ),
                SizedBox(width: 10,),
                Container(
                  width: 200,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 19,
                    ),
                    decoration: InputDecoration(
                      hintText: "Type a Message",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.attachment_outlined,color: Colors.black38,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF0087A),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.mic,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
