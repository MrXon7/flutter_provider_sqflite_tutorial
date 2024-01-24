import 'package:flutter/material.dart';
import 'package:project1/lesson3/ui/widgets/mind_item.dart';
import 'package:project1/lesson3/view_model/mind_view_model.dart';
import 'package:provider/provider.dart';

class AllMIndsPage extends StatefulWidget {
  const AllMIndsPage({super.key});

  @override
  State<AllMIndsPage> createState() => _AllMIndsPageState();
}

class _AllMIndsPageState extends State<AllMIndsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("All minds Page"),
      ),
      body: Consumer<MindViewModel>(builder: (context, value, child) {
        if (value.mind == null) {
          context.read<MindViewModel>().readMind();
        } else if (value.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: value.mind!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var mind = value.mind![index];
                return MindItem(mind: mind);
              });
        }
        return Container();
      }),
    );
  }
}
