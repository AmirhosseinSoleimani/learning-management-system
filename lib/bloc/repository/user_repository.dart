import '../../models/user.dart';

class UserRepository{
  static Future<User> authenticate(String mobile,String pass) async {

    return await Future.delayed(const Duration(seconds: 3)).then((value) {
      if(mobile == "2" && pass == "1"){
        Map<String,dynamic> res = {
          "id":1,
          "name":'Amirhossein',
          "family":"Soleimani",
          "mobile":"09383202865",
          "type":1,
          "active":1,
          "token":"6F9619FF-8B86-D011-B42D-00C04FC964FF"
        };
        return User.fromJson(res);
      }
      throw Exception('mobile/password was wrong');
    });
  }

  static Future<User> verifyByToken(String token) async {

    return await Future.delayed(const Duration(seconds: 3)).then((value) {
      if(token == "6F9619FF-8B86-D011-B42D-00C04FC964FF"){
        Map<String,dynamic> res = {
          "id":1,
          "name":'Amirhossein',
          "family":"Soleimani",
          "mobile":"09383202865",
          "type":1,
          "active":1,
          "token":"6F9619FF-8B86-D011-B42D-00C04FC964FF"
        };
        return User.fromJson(res);
      }
      throw Exception('mobile/password was wrong');
    });

  }
}