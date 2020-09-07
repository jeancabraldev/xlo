import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo/models/user.dart';
import 'package:xlo/repositories/parse_errors.dart';
import 'package:xlo/repositories/table_keys.dart';

class UserRepository {
  //Cadastro de usuários
  Future<void> singUp(User user) async {
    final parseUser = ParseUser(
      user.email,
      user.password,
      user.email,
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if(response.success){
      print(response.result);
    }else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }



}
