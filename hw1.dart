import "dart:io";

void main() {
  List<String?> list = stdin.readLineSync()!.split("");

  int result = 0;

  for (String? e in list) result += int.parse(e!);

  stdout.write(result);
}
