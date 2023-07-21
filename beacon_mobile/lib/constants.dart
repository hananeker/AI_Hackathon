import 'package:flutter/material.dart';

const String server = "49.12.243.37";
// const String server = "10.0.2.2";
const String port = "80 ";
const String baseUrl = 'http://$server:$port';
const String baseApiUrl = '$baseUrl/api';
const String baseApiPictureUrl = '$baseUrl/upload/pictures';

const List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.adjust,
    ),
    label: "Offers",
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.shopping_bag,
    ),
    label: "Vouchers",
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.settings,
    ),
    label: "Setting",
  )
];
