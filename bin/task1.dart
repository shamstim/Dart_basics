import 'dart:io';

void main(List<String> arguments) {
  // 2 модуль. 1 задание. Найти НОД и НОК чисел
  print(
      'Модуль2. Задание1. Найти НОД и НОК чисел. Разложить на простые множители');
  print(
      '\nВведите через пробел целые числа, для которых необходимо найти НОД:');

  var input = stdin.readLineSync();
  var task1 = Task1(input!);

  var numbers = task1.getNumbers();

  print('\nРезультат:');

  print(
      'Для чисел ${numbers.join(', ')} наибольший общий делитель (НОД): ${task1.getNOD(numbers)}');

  print(
      'Для чисел ${numbers.join(', ')} наименьшее общее кратное (НОК): ${task1.getNOK(numbers)}');

  print('\nРазложение на простые множители:');
  task1.getFactories(numbers);
}

class Task1 {
  final String _input;
  final _numbers = <int>[];

  Task1(this._input) {
    var _strnumbers = <String>[];

    _strnumbers = _input.split(" ");

    _strnumbers.length < 2
        ? throw 'Вы должны указать не менее 2-х чисел!'
        // ignore: avoid_function_literals_in_foreach_calls
        : _strnumbers.forEach((element) {
            try {
              _numbers.add(int.parse(element));
            } catch (e) {
              throw 'Укажите целые числа!';
            }
          });
  }

  // Метод получения списка чисел
  List getNumbers() {
    return _numbers;
  }

  // Метод полуения наибольшего общего делителя НОД для множества чисел
  int getNOD(List numbers) {
    var num1 = numbers[0];

    for (var i = 1; i < numbers.length; i++) {
      num1 = _gcd(num1, numbers[i]);
    }

    return num1;
  }

  // Метод получения наименьшего общего кратного для множества чисел
  int getNOK(List numbers) {
    var num1 = numbers[0];

    for (var i = 1; i < numbers.length; i++) {
      num1 = num1 / _gcd(num1.round(), numbers[i]) * numbers[i];
    }

    return num1.round();
  }

  // Функция получения НОД для 2-х чисел
  int _gcd(int a, int b) {
    void swap(int num1, int num2) {
      a = num2;
      b = num1;
    }

    if (a < b) {
      swap(a, b);
    }

    while (b != 0) {
      a %= b;
      swap(a, b);
    }

    return a;
  }

  // Метод разложения чисел на простые множители
  void getFactories(List num) {
    for (var element in num) {
      List factories = <int>[];
      int num = element;

      for (var i = 2; i < num; i++) {
        if ((num % i) == 0) {
          factories.add(i);
          num = (num / i).round();
          i--;
          if (num < 1) break;
        }
      }
      if (num > 1) factories.add(num);

      print('Простые множители числа $element: ${factories.join(' * ')}');
    }
  }
}
