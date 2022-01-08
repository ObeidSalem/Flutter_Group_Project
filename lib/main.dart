import 'package:flutter/material.dart';
import 'package:group_project_flutter/widgets/post_widget.dart';
import 'modules/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
                                                    //Tahsin modify variable Posts to store data form database
  List<Post> posts = [
    Post("This is the first post in the app This is the first post in the app This is the first post in the app", "Obeid Salem"),
    Post("This is the second post in the app This is the first post in the app This is the first post in the app", "Warsame Abdi"),
    Post("This is the third post in the app This is the first post in the app This is the first post in the app", "Tahsin Murtag"),
    Post("This is the third post in the app This is the first post in the app This is the first post in the app", "Tahsin Murtag"),
    Post("This is the third post in the app This is the first post in the app This is the first post in the app", "Tahsin Murtag"),
    Post("This is the third post in the app This is the first post in the app This is the first post in the app", "Tahsin Murtag"),
    Post("This is the third post in the app This is the first post in the app This is the first post in the app", "Tahsin Murtag"),
    Post("This is the third post in the app This is the first post in the app This is the first post in the app", "Tahsin Murtag"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Appbar"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.logout,                         //Abdi This is for log out
                    size: 26.0,
                  ),
                )
            ),
          ],
        ),
        body: ListView(
          children: posts.map((post) {
            return PostWidget(post);
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,                                       //Tahsin this to add new post
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}