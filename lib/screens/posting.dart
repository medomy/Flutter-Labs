import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_api_example/controllers/app_controller.dart';

class PostingScreen extends StatefulWidget {
  const PostingScreen({Key? key}) : super(key: key);

  @override
  _PostingScreenState createState() => _PostingScreenState();
}

class _PostingScreenState extends State<PostingScreen> {
  var controllerTitle = TextEditingController();
  var controllerbody = TextEditingController();

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerbody.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posting sec'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: controllerTitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: controllerbody,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter body',
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              AppContrloller.postPosts(controllerbody.text, controllerTitle.text);
            },
            child: Text('add'),
          )
        ],
      ),
    );
  }
}
