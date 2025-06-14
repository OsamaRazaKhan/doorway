import 'package:doorway/data/response/status.dart';
import 'package:doorway/model/user_model.dart';
import 'package:doorway/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();
  final rxRequestStatus = Status.LOADING.obs;

  final userList = UserModel().obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserModel _value) => userList.value = _value;

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, StackTrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }
}
