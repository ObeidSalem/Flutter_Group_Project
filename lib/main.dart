// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:group_project_flutter/MyUser.dart';
import 'package:group_project_flutter/refresh.dart';
import 'package:group_project_flutter/widgets/post_widget.dart';
import 'modules/post.dart';
import 'widgets/login_page.dart';
import 'MyUser.dart';
import 'refresh.dart';
import 'firebase_options.dart';
import 'DatabaseManager.dart';
// import 'auth/login.dart';
// import 'auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Tahsin modify variable Posts to store data form database
  List<Post> posts = [
    Post(
        "This is the first post in the app This is the first post in the app This is the first post in the app",
        "Obeid Salem"),
    Post(
        "This is the second post in the app This is the first post in the app This is the first post in the app",
        "Warsame Abdi"),
    Post(
        "This is the third post in the app This is the first post in the app This is the first post in the app",
        "Tahsin Murtag"),
  ];

  late TextEditingController newPostController;
  late String newPost;
  String currentUserName =
      "Obeid Salem"; //Tahsin replace this later with user ID
  String currentUserId = "";

  // String uid = "";
  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (builder) => AlertDialog(
          title: Text("Write a Post"),
          content: TextField(
            autofocus: true,
            maxLines: 8,
            decoration: InputDecoration(hintText: "What you think?"),
            controller: newPostController,
            onSubmitted: (_) => submit(),
          ),
          actions: [
            TextButton(
              child: const Text("SUBMIT"),
              onPressed: submit,
            ),
          ],
        ),
      );

  void submit() {
    Navigator.of(context).pop(newPostController.text);
    newPostController.clear;
  }

  @override
  void initState() {
    super.initState();
    newPostController = TextEditingController();
  }

  @override
  void dispose() {
    newPostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post App"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: FloatingActionButton(
                  child: const Icon(Icons.login),
                  heroTag: 'log',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInWedget()),
                    );
                  },
                ),
              )),
        ],
      ),
      body: ListView(
          children: posts.map((post) {
        return PostWidget(post, currentUserName);
      }).toList()),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => refresh()));
            }, //Tahsin this to refresh/fetch data
            child: Icon(Icons.refresh),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: '2',
            //Tahsin this to add new post
            onPressed: () async {
              final newPost = await openDialog();
              if (newPost == null || newPost.isEmpty) return;
              setState(() => this.newPost = newPost);
              posts.add(Post(newPost, currentUserName));
            },
            child: Icon(Icons.post_add),
          ),
        ],
      ),
    );
  }
}
