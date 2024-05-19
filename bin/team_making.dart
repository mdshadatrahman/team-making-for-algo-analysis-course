import 'dart:math';

void main() {
  List<int> allStudents = [1, 2, 5, 8, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 39, 41, 42, 43, 44, 45, 46];
  List<int> leaders = [1, 8, 10, 11, 21, 27, 34, 43, 46];
  List<int> students = List.from(allStudents);

  for (int student in allStudents) {
    if (leaders.contains(student)) {
      students.remove(student);
    }
  }

  Map<int, List<int>> assignments = assignStudentsToLeaders(students, leaders);

  assignments.forEach((leader, assignedStudents) {
    print('Leader $leader: ${assignedStudents.join(', ')}');
  });
}

Map<int, List<int>> assignStudentsToLeaders(
  List<int> students,
  List<int> leaders,
) {
  // Shuffle the list of students to ensure randomness
  students.shuffle(Random());

  final Map<int, List<int>> assignments = {};
  for (int i = 0; i < leaders.length; i++) {
    assignments[leaders[i]] = [];
  }

  for (int i = 0; i < students.length; i++) {
    int leader = leaders[i % leaders.length];
    assignments[leader]?.add(students[i]);
  }

  return assignments;
}
