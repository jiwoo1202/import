import 'dart:ui';

import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:import_new_pr/util/font/font.dart';
import 'package:markdown/markdown.dart' as md;

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = '';


    if (element.attributes['class'] != null) {
      String lg = element.attributes['class'] as String;
      language = lg.substring(9);
    }
    return Container(
      width: MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width,
      child: HighlightView(
        element.textContent,
        language: 'dart',
        theme: atomOneDarkTheme,
        padding: const EdgeInsets.all(8),
        textStyle: f14w900,
      ),
    );
  }
}