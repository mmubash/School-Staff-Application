import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/userModel.dart';
import 'home_page.dart';
import 'login_page.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserModel?>();

    if (user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}
