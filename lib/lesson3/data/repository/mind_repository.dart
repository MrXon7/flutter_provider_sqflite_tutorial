import 'package:project1/lesson3/data/model/mind_model.dart';
import 'package:project1/service/local_db_service.dart';

class MindRepository {
  LocalDb? db;
  MindRepository({required this.db});

  void addMind(MindModel mind) async => await db!.addMind(mind);
  
  Future<List<MindModel>> readMind() async {
    var result = await db!.getMind();
    return result.map((e) => MindModel.fromJson(e)).toList();
  }

  void updateMind(MindModel mindModel, String mind) async => await db!.updateMind(mindModel, mind);

  void deleteMind(String mind) async => await db!.deleteMind(mind);

}
