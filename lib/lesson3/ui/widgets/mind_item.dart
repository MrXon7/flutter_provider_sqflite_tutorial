import 'package:flutter/material.dart';
import 'package:project1/lesson3/data/model/mind_model.dart';
import 'package:project1/lesson3/view_model/mind_view_model.dart';
import 'package:provider/provider.dart';

class MindItem extends StatelessWidget {
  MindModel mind;
  MindItem({super.key, required this.mind});

  TextEditingController mindCtrl = TextEditingController();
  TextEditingController author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mindCtrl.text = mind.mind;
    author.text = mind.author;
    return ListTile(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Bekor qilish")),
              TextButton(
                  onPressed: () {
                    context.read<MindViewModel>().deleteMind(mind.mind);
                    Navigator.pop(context);
                  },
                  child: const Text("Ha")),
            ],
            title: const Text("Rostdan ham o'chirmoqchimisiz"),
          ),
        );
      },
      title: Text(mind.mind),
      subtitle: Text(mind.author),
      trailing: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.read<MindViewModel>().updateMind(
                                MindModel(
                                    author: author.text, mind: mindCtrl.text),
                                mind.mind);
                            Navigator.pop(context);
                          },
                          child: const Text("Yangilash")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Bekor qilish")),
                    ],
                    content: SizedBox(
                      height: 160,
                      child: Column(
                        children: [
                          TextField(
                            controller: mindCtrl,
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
                  ));
        },
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
