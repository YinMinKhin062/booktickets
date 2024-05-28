import 'package:flutter/material.dart';

class ShadowStyle{
  static final horizontalShadow= [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: const Offset(5, 5),
                      blurRadius: 10,
                      spreadRadius: 2),
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 0,
                      spreadRadius: 0)
                ];
}