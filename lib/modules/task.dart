import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;
  bool? isFavourite;


  Task({required this.title, this.isDone, this.isDeleted, this.isFavourite}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavourite = isFavourite ?? false;
  }


  Task copyWith(
      {String? title, bool? isDone, bool? isDeleted, bool? isFavourite}) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
    'title': title,
    'isDone': isDone,
    'isDeleted': isDeleted,
    'isFavourite' : isFavourite
  };}

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        title: map['title'] ?? '',
        isDone: map['isDone'] ?? false,
        isDeleted: map['isDeleted'] ?? false,
        isFavourite: map['isFavourite'] ?? false
    );
  }

  @override
  List<Object?> get props =>
      [
        title,
        isDone,
        isDeleted,
        isFavourite,
      ];
}
