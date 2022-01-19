void main(List<String> args) {
  // Модуль 2. Задание 8. Работа со списком пользователей

  var user1 = AdminUser('test1@yandex.ru');
  print(user1.getMailSystem);

  var user2 = GeneralUser('test2@mail.ru');
  var user3 = GeneralUser('test3@mail.ru');
  var user4 = GeneralUser('test4@mail.ru');

  var users = UserManager([user1, user2, user3, user4]);

  // Выводим список всех пользователей
  print(users.listUsers().join(','));

  // Добавляем пользователя администратора
  users.addUser(AdminUser('adm@rambler.ru'));

  // Удаляем пользователя по его E-mail
  users.deleteUser('test4@mail.ru');

  // Выводим список E-mail (если Админ, то выводим только домен почты)
  print(users.listEmails().join(','));
}

class User {
  String email;

  User(this.email);

  bool isAdmin() {
    return false;
  }
}

class AdminUser extends User with UserProperty {
  AdminUser(String email) : super(email);

  @override
  bool isAdmin() {
    return true;
  }
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);

  @override
  bool isAdmin() {
    return false;
  }
}

class UserManager extends User {
  List<User> _users = [];

  UserManager(this._users) : super('');

  void addUser(user) {
    _users.add(user);
  }

  void deleteUser(String _email) {
    _users.removeWhere((item) => item.email == _email);
  }

  List listUsers() {
    List<String> _emails = [];
    _users.forEach((element) {
      _emails.add(element.email);
    });
    return _emails;
  }

  List listEmails() {
    List<String> _emails = [];
    _users.forEach((element) {
      if (element.isAdmin()) {
        _emails.add((element.email.split("@"))[1]);
      } else {
        _emails.add(element.email);
      }
    });
    return _emails;
  }
}

mixin UserProperty on User {
  String get getMailSystem => (email.split("@"))[1];
}
