import 'package:my_services/modules/home_module/models/user_model.dart';

class SupabaseService {
  String? userId;

  UserInfo? _selectedUser;

  void setSelectedUser(UserInfo user) {
    _selectedUser = user;
  }

  UserInfo? get selectedUser => _selectedUser;
  void setUserId(String id) {
    userId = id;
  }

  String? getUserId() {
    return userId;
  }

  Future<String> fetchUserData() async {
    await Future.delayed(Duration(seconds: 1));
    return "User data for $userId";
  }
}
