import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SharedPreferences? preferences;
  static const _user = "access_token";
  static const _token = "token";
  static const _userId = "userId";
  static const _userName = "userName";
  static const _userEmail = "userEmail";
  static const _userProfilePic = "userProfilePic";

  static Future init() async =>
      preferences = await SharedPreferences.getInstance();

  static dynamic setUser(String user) {
    return preferences!.setString(_user, user);
  }

  static String? getUser() {
    return preferences!.getString(_user);
  }

  static dynamic setUserId(String userId) {
    return preferences!.setString(_userId, userId);
  }

  static dynamic getUserId() {
    return preferences!.getString(_userId);
  }

  static dynamic setEmail(String userEmail) {
    return preferences!.setString(_userEmail, userEmail);
  }

  static dynamic getEmail() {
    return preferences!.getString(_userEmail);
  }

  static dynamic setToken(String token) {
    return preferences!.setString(_token, token);
  }

  static dynamic getToken() {
    return preferences!.getString(_token);
  }

  static dynamic setUserName(String userName) {
    return preferences!.setString(_userName, userName);
  }

  static dynamic getUserName() {
    return preferences!.getString(_userName);
  }

  static dynamic setProfilePic(String profilePic) {
    return preferences!.setString(_userProfilePic, profilePic);
  }

  static dynamic getProfilePic() {
    return preferences!.getString(_userProfilePic);
  }

  static dynamic removeToken() {
    return preferences!.remove(_token);
  }
}
