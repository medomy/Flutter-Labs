import 'dart:convert';
import 'dart:html';

import 'package:json_api_example/models/comment.dart';
import 'package:json_api_example/models/post.dart';
import 'package:http/http.dart' as http;

class AppContrloller {
  static Future<List<Post>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    return List<Post>.from(
        jsonDecode(response.body).map((e) => Post.fromJson(e)));
  }

  static Future<List<Comment>> getComments(int?postId) async{
    final res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=${postId}"));

    return List<Comment>.from(
      jsonDecode(res.body).map((comment)=> Comment.fromjson(comment)));

  } 
  static void postPosts(body,title) async{
    final res = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: jsonEncode(<String,dynamic>{
        'title' : title,
        'body' : body
      }),
    );
    if(res.statusCode == 201){
      print("Done and status code is ${res.statusCode}");
    }
    


  }
}
