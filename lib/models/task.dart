class Task {
  int? id;
  String? title;
  String? description;
  int? isCompleted;
  String? date;
  String? startDate;
  String? endDate;
  int? color;
  int? remind;
  String? repeat;

  Task(
      {this.id,
      this.title,
      this.description,
      this.isCompleted,
      this.date,
      this.startDate,
      this.endDate,
      this.color,
      this.remind,
      this.repeat});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['isCompleted'] = isCompleted;
    data['date'] = date;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['color'] = color;
    data['remind'] = remind;
    data['repeat'] = repeat;
    return data;
  }
}
