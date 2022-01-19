void main(List<String> args) {
  // Модуль 2. Задание 3. Из строки найти числа и вернуть коллекцию

  // Укажите строку текста
  String str = '12 3 3ew 123';

  var task3 = Task3();
  var numbers = task3.getNumbers(str);
  print(numbers);
}

class Task3 {
  // Метод получения коллекции чисел из строки
  List getNumbers(m) {
    List _numbers = m.split(' ');
    List _newNumbers = <int>[];
    _numbers.forEach((element) {
      try {
        _newNumbers.add(int.parse(element));
        // ignore: empty_catches
      } catch (e) {}
    });

    return _newNumbers;
  }
}
