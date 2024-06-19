import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:surveyapp/model/model.dart';
import 'package:surveyapp/service/service.dart';
import 'package:surveyapp/view/view.dart';

part 'welcome_controller.dart';
part 'admin_add_mandatory_controller.dart';
part 'controller_admin_list_category.dart';
part 'controller_admin_list_quiz.dart';
part 'controller_home.dart';
part 'controller_user_question.dart';
part 'controller_admin_mandatory.dart';
//part 'controller_admin_choicebased.dart';
part 'controller_register.dart';
part 'controller_login.dart';
part 'controller_profile.dart';
part 'controller_home_admin.dart';
part 'controller_forget_password.dart';
