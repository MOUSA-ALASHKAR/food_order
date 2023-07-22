import 'package:food_order/core/data/network/network_config.dart';

class UserEndpoints
{
  static String login=NetworkConfig.getFullApiUrl('user/login');
  static String register = NetworkConfig.getFullApiUrl('User/Register');
}