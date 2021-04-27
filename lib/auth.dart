import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


const KuserToken = 'usertoken';
const KuserEmail = 'email';
const KuserUserName = 'username';

class UserAuth extends GetxService {
  String _tokan;

  GetStorage storage = GetStorage();

  void setUserToken(String value) {
    storage.write(KuserToken, value);
  }

  void setUserName(String value) {
    storage.write(KuserUserName, value);
  }

  void setUserEmail(String value) {
    storage.write(KuserEmail, value);
  }

  String getUserToken() {
    return storage.read(KuserToken);
  }

  String getUserName() {
    return storage.read(KuserUserName);
  }

  String getUserEmail() {
    return storage.read(KuserEmail);
  }

}
