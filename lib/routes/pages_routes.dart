import 'package:get/get.dart';
import 'package:to_do_list/binding/binding.dart';
import 'package:to_do_list/view/view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const TodoView(),
      binding: TodoBinding(),
    ),
  ];
}