import 'package:flutter/foundation.dart';
import 'package:project1/lesson3/data/model/mind_model.dart';
import 'package:project1/lesson3/data/repository/mind_repository.dart';

class MindViewModel extends ChangeNotifier {
  MindRepository? mindRepository;
  MindViewModel({required this.mindRepository});

  List<MindModel>? mind;
  bool isLoading = false;

  void addMind(MindModel mind) async {
    mindRepository!.addMind(mind);
  }

  void readMind() async {
    loadingChanger();
    mind = await mindRepository!.readMind();
    loadingChanger();
  }

  void updateMind(MindModel mindModel, String mind) async {
    mindRepository!.updateMind(mindModel, mind);
    readMind();
  }

  void deleteMind( String mind) async {
    mindRepository!.deleteMind(mind);
    readMind();
  }

  void loadingChanger() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
