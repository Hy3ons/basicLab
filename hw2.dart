import 'dart:convert';
import 'dart:math';

final ran = Random();

class Student {
  Student({required this.kor, required this.eng, required this.math});
  final int kor, eng, math;

  String name = "";
  double avg = 0;

  void setAvg() {
    avg = (kor + eng + math) / 3.0;
  }

  double get getAvg {
    return (kor + eng + math) / 3.0;
  }

  String toString() {
    return '${name.toString().padLeft(4)} ${kor.toString().padLeft(4)} ${eng.toString().padLeft(4)} ${math.toString().padLeft(4)} ${avg.toStringAsFixed(3)}';
  }
}

void main() {
  final List<Student> studentList = [];

  for (int i = 0; i < 5; i++) {
    Student a = Student(
      kor: ran.nextInt(101),
      math: ran.nextInt(101),
      eng: ran.nextInt(101),
    );

    a.name = AsciiDecoder().convert([65 + i]);
    studentList.add(a);
  }

  const String tableLabel = "이름, 국어, 영어, 수학, 평균";

  print(tableLabel);

  for (Student st in studentList) {
    st.avg = (st.eng + st.kor + st.math) / 3.0;
    print(st.toString());
  }

  //평균으로 정렬
  print("평균으로 정렬");
  print(tableLabel);

  List copied = List.from(studentList);

  copied.sort((a, b) => a.avg < b.avg ? -1 : 1);

  for (Student st in copied) {
    print(st.toString() + (st.avg > 50.0 ? " PASS" : " FAIL"));
  }
}
