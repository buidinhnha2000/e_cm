import 'package:flutter/material.dart';

const List<FooterItem> items = [
  FooterItem(Icons.home, "Home"),
  FooterItem(Icons.email_outlined, "Shop Mall"),
  FooterItem(Icons.notifications_none, "Notification"),
  FooterItem(Icons.manage_accounts_outlined, "Profile"),
];

class FooterItem {
  final String text;
  final IconData icon;

  const FooterItem(this.icon, this.text);
}

const List<CategoriItem> listCategori = [
  CategoriItem(Icons.ac_unit, "0 USD",),
  CategoriItem(Icons.access_alarm_outlined, "Fashion"),
  CategoriItem(Icons.agriculture_outlined, "Device"),
  CategoriItem(Icons.toys, "Food"),
  CategoriItem(Icons.menu_sharp, "Water"),
];

class CategoriItem {
  final String text;
  final IconData icon;

  const CategoriItem(this.icon, this.text);
}


