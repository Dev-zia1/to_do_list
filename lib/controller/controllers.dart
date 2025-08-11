import 'package:get/get.dart';
import 'package:to_do_list/models/models.dart';
import 'package:to_do_list/services/services_storage.dart';
class TodoController extends GetxController {
  final RxList<TaskModel> tasks = <TaskModel>[].obs;
  final ServicesStorage storage = ServicesStorage();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    tasks.assignAll(storage.readTask());
  }

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    tasks.add(TaskModel(title: title));
    storage.saveTask(tasks);
  }

  void toggleTask(int index) {
    final t = tasks[index];
    t.done = !t.done; // model is mutable here
    tasks.refresh();
    storage.saveTask(tasks);
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    storage.saveTask(tasks);
  }
}