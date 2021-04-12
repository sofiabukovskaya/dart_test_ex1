import 'dart:io';
import 'dart:convert';

int? countResult;
int visitorsWithNewlyweds = 1;

void main() {
  print('Enter count of visitors');
  readLine().listen(processLine);
}

Stream<String> readLine() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

void processLine(String line) {
  int n = int.tryParse(line)!;
  countCost(n);
}

void countCost(int n) {
  print('Enter names of visitors');
  try {
    for (int i = 1; i<n; i++) {
      var line = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
      if (line!.contains('\+one')) {
        visitorsWithNewlyweds += 2;
      } else {
        ++visitorsWithNewlyweds;
      }
    }
  } on Exception catch(e) {
    print(e.toString());
  }
  if (visitorsWithNewlyweds == 13) {
    ++visitorsWithNewlyweds;
  }
  countResult = ((visitorsWithNewlyweds + 2) *100);
  print("Result $countResult");
}
