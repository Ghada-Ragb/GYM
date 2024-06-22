import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:gym/model/PushUps.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getAssetPath(String asset) async {
  final path = await getLocalPath(asset);
  await Directory(dirname(path)).create(recursive: true);
  final file = File(path);
  if (!await file.exists()) {
    final byteData = await rootBundle.load(asset);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }
  return file.path;
}

Future<String> getLocalPath(String path) async {
  return '${(await getApplicationSupportDirectory()).path}/$path';
}

double angle(PoseLandmark firstLandMark, PoseLandmark midLandMark,
    PoseLandmark lastLandMark) {
  final radians = math.atan2(
          lastLandMark.y - midLandMark.y, lastLandMark.x - midLandMark.x) -
      math.atan2(
          firstLandMark.y - midLandMark.y, firstLandMark.x - midLandMark.x);

  double degrees = radians * 180.0 / math.pi;
  degrees = degrees.abs();
  if (degrees > 180.0) {
    degrees = 360.0 - degrees;
  }
  return degrees;
}

PushUpState? IsPushUp(double angleElbow, PushUpState current) {
  final umbralElbow = 60.0;
  final umbralElbowExt = 160.0;

  if (current == PushUpState.neutral &&
      angleElbow > umbralElbowExt &&
      angleElbow < 180.0) {
    return PushUpState.init;
  } else if (current == PushUpState.init &&
      angleElbow < umbralElbow &&
      angleElbow > 40.0) {
    return PushUpState.complete;
  }
}
