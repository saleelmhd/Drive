import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? localstorage;


  class LocalStore{
   static init() async {
    localstorage = await SharedPreferences.getInstance();
  }
   
}