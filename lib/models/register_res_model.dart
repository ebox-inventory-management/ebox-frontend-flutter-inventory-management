import 'package:ebox_frontend_web_inventory/models/user_res_models.dart';

class RegisterResModel {
  User? user;
  String? token;

  RegisterResModel({this.user, this.token});

  RegisterResModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}
