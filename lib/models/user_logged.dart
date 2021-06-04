class UserLogged {
  String userToken;
  UserLogged(this.userToken);

  UserLogged.map(dynamic obj) {
    this.userToken = obj["user_token"];
  }

  String get uUserToken => userToken;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["user_token"] = uUserToken;

    return map;
  }
}
