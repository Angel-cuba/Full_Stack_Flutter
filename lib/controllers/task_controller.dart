import 'package:get/get.dart';
import '../database/database.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DataBaseHelper.insertTask(task!);
  }

  Future<void> getTasks() async {
    List<Map<String, dynamic>> tasks = await DataBaseHelper.query();
    taskList.assignAll(tasks.map((e) => Task.fromJson(e)).toList());
  }
}
