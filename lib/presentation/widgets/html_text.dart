import 'package:flutter/material.dart';

class HtmlText extends StatelessWidget {
  HtmlText(this.html, {required this.style});

  final String html;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _parseHtml(html),
      ),
    );
  }

  List<Widget> _parseHtml(String htmlString) {
    List<Widget> widgets = [];

    RegExp exp = RegExp(
      r'<[^>]*>',
      multiLine: true,
      caseSensitive: true,
    );
    String plainText = htmlString.replaceAll(exp, '');

    List<String> paragraphs = plainText.split('\n');

    for (String paragraph in paragraphs) {
      widgets.add(Text(
        paragraph,
        style: style,
      ));
    }

    return widgets;
  }
}
