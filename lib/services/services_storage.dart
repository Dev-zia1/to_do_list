import 'package:to_do_list/models/models.dart';
import 'package:get_storage/get_storage.dart';

class ServicesStorage {
  final GetStorage _box = GetStorage();
  final String _key = 'services';

  List<TaskModel>readTask(){
    final data = _box.read(_key)??[];
    return List<Map<String, dynamic>>.from(data).map((e) => TaskModel.fromJson(e)).toList();
  }
  void saveTask(List<TaskModel>tasks){
    final jsonList=tasks.map((t)=>t.toJson()).toList();
    _box.write(_key, jsonList);
  }
}
