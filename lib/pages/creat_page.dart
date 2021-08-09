import 'package:flutter/material.dart';
import 'package:patterns_scoped/models/post_model.dart';
import 'package:patterns_scoped/scopes/creat_scoped.dart';
import 'package:patterns_scoped/services/http_request.dart';

class CreatPage extends StatefulWidget {

  static final String id = "creat_page";

  @override
  _CreatPageState createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {

  CreatScoped creatScoped = new CreatScoped();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Creat Post"),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(

                children: [
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: creatScoped.titleController,
                      decoration: InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder (),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    height: 100,
                    width: double.infinity,
                    child: TextField(
                      controller: creatScoped.postController,
                      decoration: InputDecoration(
                        labelText: "Post",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      creatScoped.apiCreatPost (context);
                    },
                    child: Text("Creat post"),
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            creatScoped.isLoading ? Center (
              child: CircularProgressIndicator(),
            ) : SizedBox.shrink(),

          ],
        )
    );
  }
}