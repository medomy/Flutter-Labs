import 'package:flutter/material.dart';
import 'package:json_api_example/models/comment.dart';
import 'package:json_api_example/controllers/app_controller.dart';


class CommentScreen extends StatefulWidget {
  final int? postId;
  const CommentScreen(this.postId, { Key? key }) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<Comment> incomingComments= [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async{
      var comments = await AppContrloller.getComments(widget.postId);
      setState(() {
      incomingComments = comments;
    });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comments sec'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.send)),
          ],
        ),
        body: incomingComments.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: incomingComments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(incomingComments[index].name.toString()),
                    subtitle: Text(incomingComments[index].body.toString()),
                  );
                }));
  }
}