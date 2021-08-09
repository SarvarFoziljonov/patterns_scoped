
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_scoped/models/post_model.dart';
import 'package:patterns_scoped/scopes/home_scoped.dart';

Widget itemList (HomeScoped scoped, BuildContext context, Post post) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title.toUpperCase(), style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text(post.body, style: TextStyle(color: Colors.blueGrey),),
        ],
      ),
    ),
    actions: [
      IconSlideAction(
        caption:  "Update",
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: (){
          scoped.apiUpdatePost(context, post);
        },
      ),
    ],
    secondaryActions: [
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: Icons.delete,
        onTap: (){
          scoped.apiPostDelete(post).then((value) => {
            if (value) scoped.apiPostList(),
          });
        },
      ),
    ],
  );
}