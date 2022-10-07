import 'package:flutter/material.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/pages/create_group_page.dart';
import 'package:flutter_social_app/futures/presentation/pages/forgot_page.dart';
import 'package:flutter_social_app/futures/presentation/pages/login_page.dart';
import 'package:flutter_social_app/futures/presentation/pages/my_chat_page.dart';
import 'package:flutter_social_app/futures/presentation/pages/registration_page.dart';
import 'package:flutter_social_app/futures/presentation/pages/single_chat_page.dart';
import 'package:flutter_social_app/page_const.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.createGroupPage:
        {
          if (args is String) {
            return materialBuilder(
              widget: CreateGroupPage(
                uid: args,
              ),
            );
          } else {
            return materialBuilder(
              widget: const ErrorPage(),
            );
          }
        }
      case PageConst.singleChatPage:
        {
          if (args is SingleChatEntity) {
            return materialBuilder(
              widget: SingleChatPage(
                singleChatEntity: args,
              ),
            );
          } else {
            return materialBuilder(
              widget: const ErrorPage(),
            );
          }
        }
      case PageConst.myChatPage:
        {
          if (args is MyChatPageArguments) {
            return materialBuilder(
              widget: MyChatPage(
                arguments: args,
              ),
            );
          } else {
            return materialBuilder(
              widget: const ErrorPage(),
            );
          }
        }
      case PageConst.loginPage:
        {
          return materialBuilder(widget: const LoginPage());
        }
      case PageConst.forgotPage:
        {
          return materialBuilder(widget: const ForgotPage());
        }
      case PageConst.registrationPage:
        {
          return materialBuilder(widget: const RegistrationPage());
        }
      case PageConst.phoneRegistrationPage:
      default:
        return materialBuilder(widget: const ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
