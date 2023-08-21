import 'dart:convert';

import 'package:flutter/material.dart';
/// Model for Cat
class Cat {
  final String id;
  final List<String> tags;
  final String owner;
  final String createdAt;
  final String updatedAt;
  const Cat({
    required this.id,
    required this.tags,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Cat.fromJson(Map<String, dynamic> json) {
    List<dynamic> dynList = json['tags'];
    List<String> tags = [];
    for (String str in dynList) { tags.add(str); }
    return Cat(
      id: json['_id'] as String,
      tags: tags,
      owner: json['owner'] as String,
      createdAt: (json['createdAt'] as String),
      updatedAt: (json['updatedAt'] as String),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'tags': tags,
      'owner': owner,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}