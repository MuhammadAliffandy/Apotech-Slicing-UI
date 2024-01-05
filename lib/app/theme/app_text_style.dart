import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle light(
    BuildContext context, {
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w300,
              color: color,
              height: height,
            ) ??
        const TextStyle();
  }

  static TextStyle regular(
    BuildContext context, {
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: color,
              height: height,
            ) ??
        const TextStyle();
  }

  static TextStyle medium(
    BuildContext context, {
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: color,
              height: height,
            ) ??
        const TextStyle();
  }

  static TextStyle semiBold(
    BuildContext context, {
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: color,
              height: height,
            ) ??
        const TextStyle();
  }

  static TextStyle bold(
    BuildContext context, {
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: color,
              height: height,
            ) ??
        const TextStyle();
  }

  static TextStyle extraBold(
    BuildContext context, {
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
              color: color,
              height: height,
            ) ??
        const TextStyle();
  }
}
