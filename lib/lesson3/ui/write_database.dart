import 'package:flutter/material.dart';
import 'package:project1/lesson3/data/model/mind_model.dart';
import 'package:project1/lesson3/ui/all_mind_page.dart';
import 'package:project1/lesson3/view_model/mind_view_model.dart';
import 'package:provider/provider.dart';

class WriteDbPage extends StatelessWidget {
  WriteDbPage({super.key});
  TextEditingController mind = TextEditingController();
  TextEditingController author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write Db"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                 context.read<MindViewModel>().readMind();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllMIndsPage()));
              },
              icon: Icon(Icons.read_more))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: mind,
              decoration: InputDecoration(
                label: Text("Quote"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              controller: author,
              decoration: InputDecoration(
                label: Text("Author"),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context
              .read<MindViewModel>()
              .addMind(MindModel(author: author.text, mind: mind.text));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
