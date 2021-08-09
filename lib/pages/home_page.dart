import 'package:flutter/material.dart';
import 'package:patterns_scoped/scopes/home_scoped.dart';
import 'package:patterns_scoped/views/item_of_post.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

HomeScoped scoped = new HomeScoped();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scoped.apiPostList ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SetState"),
      ),
      body: ScopedModel <HomeScoped>(
       model: scoped,
       child: ScopedModelDescendant <HomeScoped>(
         builder:  (context, child, model) {
           return Stack(
             children: [
               ListView.builder(
                 itemCount: scoped.items.length,
                 itemBuilder: (ctx, index) {
                   return itemList (scoped, context, scoped.items[index]);
                 },
               ),
               scoped.isLoading ? Center (
                 child: CircularProgressIndicator(),
               ) : SizedBox.shrink(),

             ],
           );
         },
       ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          scoped.apiCreatePost(context);
        },
      ),

    );
  }



}
