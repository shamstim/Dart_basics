void main(List<String> args) {
  // Модуль2. Задание 4. Получить Map из коллекции слов с количеством символов слова

  List words = <String>[
    'автомобиль',
    'собака',
    'улица',
    'телефон',
    'диван',
    'велосипед',
    'кухня',
    'кружка'
  ];

  var task4 = Task4();
  var mapWords = task4.getMap(words);

  print(mapWords);
}

class Task4 {
  // Метод получения Map из слов
  Map getMap(List _words) {
    Map<String, int> _wordsMap = {};
    _words.forEach((element) {
      _wordsMap.addAll({element: element.length});
    });

    return _wordsMap;
  }
}
