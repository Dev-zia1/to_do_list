import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controller/controllers.dart';  

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find();
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade100,
              Colors.blue.shade500,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 50), // Add some space at the top
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: 'Enter new task...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade500),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSubmitted: (v) {
                        controller.addTask(v);
                        textController.clear();
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.blue.shade500),
                    onPressed: () {
                      controller.addTask(textController.text);
                      textController.clear();
                    },
                  )
                ],
              ),
              SizedBox(height: 20), // Add some space between the TextField and the ListView
              Expanded(
                child: Obx(() {
                  return AnimatedOpacity(
                    opacity: controller.tasks.isEmpty ? 0 : 1,
                    duration: const Duration(milliseconds: 500),
                    child: ListView.builder(
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        final task = controller.tasks[index];
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Checkbox(
                              value: task.done,
                              onChanged: (_) => controller.toggleTask(index),
                            ),
                            title: Text(
                              task.title,
                              style: TextStyle(
                                decoration: task.done
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => controller.deleteTask(index),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}