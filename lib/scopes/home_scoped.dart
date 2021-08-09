import 'package:flutter/material.dart';
import 'package:patterns_scoped/models/post_model.dart';
import 'package:patterns_scoped/pages/creat_page.dart';
import 'package:patterns_scoped/pages/update_page.dart';
import 'package:patterns_scoped/services/http_request.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScoped extends Model {

  List <Post> items = new List();
  bool isLoading;

  void apiPostList () async {
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null ) {
      items = Network.parsePostList(response);
    } else {
      print ("No info");
    }
    isLoading = false;
    notifyListeners();
  }

  void apiCreatePost(BuildContext context) async{
    String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatPage()));
    items.add(Network.parsePost(result));
  }

  void apiUpdatePost(BuildContext context, Post post) async{
    String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePage(post: post,)));
    Post post2 = Network.parsePost(result);
    items[items.indexWhere((element) => element.id == post2.id)] = post2;
  }

  Future <bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    print(response);

    isLoading = false;
    notifyListeners();

    return response != null;
  }


}