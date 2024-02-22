import 'package:flutter/foundation.dart';

ValueNotifier<bool> obscureOldPassword= ValueNotifier<bool>(true);
ValueNotifier<bool> obscureNewPassword= ValueNotifier<bool>(true);
ValueNotifier<bool> obscureChangePasswordConfirmPassword = ValueNotifier<bool>(true);
ValueNotifier<String?> newPasswordValue = ValueNotifier<String?>(null);