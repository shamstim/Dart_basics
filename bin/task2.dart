import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print(
      'Модуль2. Задание2\nПеревод целого числа из десятичной системы в двоичную');
  print('Введите целое число: ');
  var input = stdin.readLineSync();

  var task2 = Task2(input!);
  var number = task2.getNumber();

  var binary = task2.toBinary(number);
  print('Двоичное число: ${binary.join('')}');

  print('\nМодуль2. Задание2\nПеревод десятичного числа в двоичное');
  print('Введите двоичное число: ');
  input = stdin.readLineSync();
  var task2_1 = Task2(input!);

  var binary2 = task2_1.getBinary();
  print('Десятичное число: ${task2_1.toDecimal(binary2)}');
}

class Task2 {
  final String _input;
  // ignore: prefer_typing_uninitialized_variables
  var _number;

  Task2(this._input) {
    try {
      _number = int.parse(_input);
    } catch (e) {
      print('Укажите целое число!');
    }
  }

  int getNumber() {
    return _number;
  }

  //Метод получения двоичного числа из введенной строки
  String getBinary() {
    List _test = _input.split('');
    _test.forEach((element) {
      if (element != '0' && element != '1') {
        throw 'Вы указали не двоичное число!';
      }
    });
    return _input;
  }

  // Метод приведения числа в двоичное
  List toBinary(_number) {
    List binary = <int>[];

    while (_number ~/ 2 >= 0) {
      binary.add(_number % 2);
      _number ~/= 2;
      if (_number == 0) {
        break;
      }
    }

    return binary.reversed.toList();
  }

  // Метод перевода двоичного числа в десятичное
  int toDecimal(_str) {
    List _decimal = _str.split('');
    List _reverse = [..._decimal.reversed];
    int _n = 0;

    for (var i = 0; i < _decimal.length; i++) {
      _n += (pow(2, i)).round() * int.parse(_reverse[i]);
    }

    return _n;
  }
}
