void main(List<String> args) {
  // Модуль 2. Задание 7. Вычислить корень заданной степени числа без math

  int num = 256;
  int pow = 4;

  print("Число, корень которого считаем: $num");
  print("Корень степени: $pow");

  print('Результат: ${num.getRoot(pow)}');
}

extension on num {
  num toPow(int x) {
    num result = 1;
    num current = this;

    while (x > 0) {
      if (x % 2 == 1) {
        result *= current;
      }
      current *= current;
      x = (x / 2).floor();
    }
    return result;
  }

  num getRoot(int pow) {
    double x = 1;
    double current = toDouble();
    try {
      for (int i = 0; i < 1000; i++) {
        if (x ==
            (x =
                1.0 / pow * (((pow - 1) * x) + (current / x.toPow(pow - 1))))) {
          break;
        }
      }
      return x;
    } catch (e) {
      throw 'Ошибка извлечения корня';
    }
  }
}
