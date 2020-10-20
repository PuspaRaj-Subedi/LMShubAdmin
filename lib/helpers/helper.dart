import 'dart:async';
import 'package:LMShubAdmin/elements/LoadingWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Helper {
  BuildContext context;
  DateTime currentBackPressTime;

  Helper.of(BuildContext _context) {
    this.context = _context;
  }
  // for mapping data retrieved form json array
  static getData(Map<String, dynamic> data) {
    return data['data'] ?? [];
  }

  static getObjectData(Map<String, dynamic> data) {
    return data['data'] ?? new Map<String, dynamic>();
  }

  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color: Colors.white.withOpacity(0.85),
          child: LoadingWidget(height: 200),
        ),
      );
    });
    return loader;
  }

  static hideLoader(OverlayEntry loader) {
    Timer(Duration(milliseconds: 500), () {
      try {
        loader?.remove();
      } catch (e) {}
    });
  }
}
