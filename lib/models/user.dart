class User {
  String _username;
  String _name;
  String _surname;
  String _email;
  String _country;
  String _password;
  User(this._name, this._surname, this._email, this._country, this._password);

  User.map(dynamic obj) {
    this._username = obj["username"];
    this._name = obj["name"];
    this._surname = obj["surname"];
    this._email = obj["email"];
    this._country = obj["country"];
    this._password = obj["password"];
  }

  String get username => _username;
  String get name => _name;
  String get surname => _surname;
  String get email => _email;
  String get country => _country;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["name"] = _name;
    map["surname"] = _surname;
    map["email"] = _email;
    map["country"] = _country;
    map["password"] = _password;

    return map;
  }
}
