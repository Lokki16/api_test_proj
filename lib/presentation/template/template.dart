library template.dart;

// packages
export 'package:flutter/material.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:get/get.dart';

// navigation
export '../../data/navigation/routes.dart';

// repositories
export '../../data/repositories/authorization/authorization_repository.dart';
export '../../data/repositories/change_password/change_password_repository.dart';
export '../../data/repositories/notification/notification_repository.dart';
export '../../data/repositories/renew_token/renew_token_repository.dart';

// models
export '../../data/models/notification/notification_model.dart';
export '../../data/models/user/user_model.dart';

// bloc
export '../../bloc/initial_route/initial_route_bloc.dart';
export '../../bloc/authorization/authorization_bloc.dart';
export '../../bloc/change_password/change_password_bloc.dart';
export '../../bloc/notification/notification_bloc.dart';

// layout
export '../layout/default_body.dart';

// widgets
export '../widgets/custom_appbar.dart';
export '../widgets/custom_button.dart';
export '../widgets/custom_column.dart';
export '../widgets/custom_popup.dart';
export '../widgets/custom_textfield.dart';

// pages
export '../../presentation/pages/authorization/authorization_page.dart';
export '../../presentation/pages/change_password/change_password_page.dart';
export '../../presentation/pages/home/home_page.dart';
