void main(List<String> args) {
  List listWords = <String>[
    'one, two, zero, zero',
    'cat, dog, six, bike, two',
    'city, zero, two, apple, two, like',
    'four, table, light, one, sofa, five'
  ];

  var task5 = Task5();
  task5.getNumbers(listWords);
}

class Task5 {
  // Метод поиска цифр в строках
  void getNumbers(List str) {
    str.forEach((element) {
      print(getListFromStr(element));
    });
  }
}

Set<int> getListFromStr(String str) {
  List _listStr = str.split(', ');
  Set<int> _numbers = {};
  _listStr.forEach((element) {
    switch (element) {
      case 'zero':
        _numbers.add(0);
        break;
      case 'one':
        _numbers.add(1);
        break;
      case 'two':
        _numbers.add(2);
        break;
      case 'three':
        _numbers.add(3);
        break;
      case 'four':
        _numbers.add(4);
        break;
      case 'five':
        _numbers.add(5);
        break;
      case 'six':
        _numbers.add(6);
        break;
      case 'seven':
        _numbers.add(7);
        break;
      case 'eight':
        _numbers.add(8);
        break;
      case 'nine':
        _numbers.add(9);
        break;
    }
  });

  return _numbers;
}
