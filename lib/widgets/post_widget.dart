
import 'package:flutter/material.dart';
import 'package:group_project_flutter/modules/post.dart';

class PostWidget extends StatelessWidget {

  late Post post;

  PostWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child:
                    Text(
                      post.content,
                      style: TextStyle(fontSize: 16),
                    )
                ),
                SizedBox(height: 10.0),
                SizedBox(
                    width: double.infinity,
                    child: Text(
                      'By ${post.auther}',
                      style: const TextStyle(color: Colors.black87, fontSize: 14),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}