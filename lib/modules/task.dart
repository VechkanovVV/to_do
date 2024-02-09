import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;
  bool? isFavourite;
  bool? isRed;
  bool? isGreen;
  bool? isYellow;
  bool isVisible = true;

  Task(
      {required this.title,
      this.isDone,
      this.isDeleted,
      this.isFavourite,
      this.isRed,
      this.isYellow,
      this.isGreen}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavourite = isFavourite ?? false;
    isRed = isRed ?? false;
    isYellow = isYellow ?? false;
    isGreen = isGreen ?? false;
  }

  Task copyWith(
      {String? title,
      bool? isDone,
      bool? isDeleted,
      bool? isFavourite,
      bool? isRed,
      bool? isYellow,
      bool? isGreen}) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavourite: isFavourite ?? this.isFavourite,
      isRed: isRed ?? this.isRed,
      isYellow: isYellow ?? this.isYellow,
      isGreen: isGreen ?? this.isGreen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavourite': isFavourite,
      'isRed': isRed,
      'isYellow': isYellow,
      'isGreen': isGreen,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      isDone: map['isDone'] ?? false,
      isDeleted: map['isDeleted'] ?? false,
      isFavourite: map['isFavourite'] ?? false,
      isRed: map['isRed'] ?? false,
      isYellow: map['isYellow'] ?? false,
      isGreen: map['isGreen'] ?? false,
    );
  }

  @override
  List<Object?> get props => [
        title,
        isDone,
        isDeleted,
        isFavourite,
        isRed,
        isYellow,
        isGreen,
      ];
}
