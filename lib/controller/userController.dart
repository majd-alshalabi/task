import 'package:task2/model/userModel.dart';
import 'package:task2/shared/sqfliteHelper.dart';

class UserController {
  static Future<void> addToDatabase(UserModel userModel) async {
    await DatabaseHelper.addRowToDataBase(userModel);
  }

  static Future<UserModel> userAndPasswordAreInDatabase(
      UserModel userModel) async {
    List<UserModel> li =
        await DatabaseHelper.cheakUsernameAndPasswordDatabase(userModel);

    if (li.isEmpty)
      return UserModel(id: -1, email: 'email', password: 'password');
    return li[0];
  }

  static Future<UserModel> userAreInDatabase(UserModel userModel) async {
    List<UserModel> li = await DatabaseHelper.cheakUserDatabase(userModel);
    if (li.isEmpty)
      return UserModel(id: -1, email: 'email', password: 'password');
    return li[0];
  }
}
