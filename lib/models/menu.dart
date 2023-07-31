import 'package:flutter/material.dart';

class Menu {
  String? slug;
  String? label;
  Icon? icon;

  Menu({this.slug, this.label, this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    label = json['label'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['label'] = label;
    data['icon'] = icon;
    return data;
  }
}
