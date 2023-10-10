import 'package:appskeleton/presentation/pages/comment_page/comment_page.dart';
import 'package:appskeleton/presentation/pages/home_page/home_page.dart';
import 'package:appskeleton/presentation/pages/login/cubit/login_page.dart';
import 'package:appskeleton/presentation/pages/signup/cubit/signup_page.dart';
import 'package:flutter/material.dart';

RouteSettings? settings;

var routes = <String, WidgetBuilder>{
  HomePage.routeName: (ctx) => const HomePage(),
  SignUp.routeName: (ctx) => const SignUp(),
  LogIn.routeName: (ctx) => const LogIn(),
  CommentPage.routeName: (ctx) =>
      CommentPage(postId: (settings?.arguments as List)[0]),
};

goToHome(BuildContext context) {
  /* check auth and if false redirect to login */
  Navigator.of(context)
      .pushNamedAndRemoveUntil(HomePage.routeName, (r) => r.isFirst);
}

goToSignUp(BuildContext context) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(SignUp.routeName, (r) => r.isFirst);
}

goToLogIn(BuildContext context) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(LogIn.routeName, (r) => r.isFirst);
}

goToComment(BuildContext context, {required int postId}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
      CommentPage.routeName, (r) => r.isFirst,
      arguments: [postId]);
}
