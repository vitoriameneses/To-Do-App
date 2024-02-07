import 'package:flutter/material.dart';

class SigninSignupModel extends ChangeNotifier {
  // State fields
  final unfocusNode = FocusNode();
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  FocusNode? email1FocusNode;
  TextEditingController? email1Controller;
  String? Function(BuildContext, String?)? email1ControllerValidator;

  FocusNode? password1FocusNode;
  TextEditingController? password1Controller;
  late bool password1Visibility;
  String? Function(BuildContext, String?)? password1ControllerValidator;

  FocusNode? usernameFocusNode;
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;

  FocusNode? email2FocusNode;
  TextEditingController? email2Controller;
  String? Function(BuildContext, String?)? email2ControllerValidator;

  FocusNode? password2FocusNode;
  TextEditingController? password2Controller;
  late bool password2Visibility;
  String? Function(BuildContext, String?)? password2ControllerValidator;

  FocusNode? password3FocusNode;
  TextEditingController? password3Controller;
  late bool password3Visibility;
  String? Function(BuildContext, String?)? password3ControllerValidator;

  // Initialization and disposal methods.
  void initState(BuildContext context) {
    password1Visibility = false;
    password2Visibility = false;
    password3Visibility = false;
  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
    tabBarController?.dispose();
    email1FocusNode?.dispose();
    email1Controller?.dispose();

    password1FocusNode?.dispose();
    password1Controller?.dispose();

    usernameFocusNode?.dispose();
    usernameController?.dispose();

    email2FocusNode?.dispose();
    email2Controller?.dispose();

    password2FocusNode?.dispose();
    password2Controller?.dispose();

    password3FocusNode?.dispose();
    password3Controller?.dispose();
  }

  // Action blocks and additional helper methods go here.
}

SigninSignupModel createModel(
    BuildContext context, SigninSignupModel Function() modelCreator) {
  final model = modelCreator();
  model.initState(context);
  return model;
}
