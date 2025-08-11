import 'package:get/get.dart';
import 'package:to_do_list/controller/controllers.dart';
class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}