import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TaskModel {
  final int? id;
  //TaskName
  final String taskName;
  final int taskPriority;
  // Stores selected time
  final TimeOfDay taskTime;
  // Stores selected date
  final DateTime taskDate;

  final bool isRecurring;
  final bool isCompleted;

  // Task notification type?

  //Geofence location of task?

  const TaskModel({
    this.id,
    required this.taskName,
    required this.taskPriority,
    required this.taskTime,
    required this.taskDate,
    required this.isRecurring,
    required this.isCompleted,
  });

  // Convert TaskModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'taskPriority': taskPriority,
      'taskTime': taskTime.hour.toString() + ':' + taskTime.minute.toString(),
      'taskDate': DateFormat('yyyy-MM-dd').format(taskDate),
      'isRecurring': isRecurring ? 1 : 0,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int?,
      taskName: map['taskName'] as String,
      taskPriority: map['taskPriority'] as int,
      taskTime: TimeOfDay(
        // Ensure robust parsing
        hour: int.parse((map['taskTime'] as String).split(':')[0]),
        minute: int.parse((map['taskTime'] as String).split(':')[1]),
      ),
      taskDate: DateTime.parse(map['taskDate'] as String),
      isRecurring: (map['isRecurring'] as int) == 1,
      isCompleted: (map['isCompleted'] as int) == 1,
    );
  }

  @override
  String toString() {
    return 'TaskModel{taskName: $taskName, taskPriority: $taskPriority, taskTime: $taskTime, taskDate: $taskDate, isRecurring: $isRecurring, isCompleted: $isCompleted}';
  }
}
