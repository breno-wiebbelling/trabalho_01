import 'package:trabalho1/common/base_client.dart';
import 'package:trabalho1/common/local_storage.dart';
import 'package:trabalho1/user/user_dto.dart';

class UserClient{
  
  final String _userUri = '/user';
  final String _userLogin = '/user/login';

  final LocalStorage _localStorage = LocalStorage();
  final BaseClient _baseClient = BaseClient();

  Future<bool> login ( String email, String userPassword) async {
    return _baseClient
      .post(_userLogin, { "name":email, "password": userPassword })
      .then((response) {
        //TODO
        print(response);
        return true;
      });
  }
}