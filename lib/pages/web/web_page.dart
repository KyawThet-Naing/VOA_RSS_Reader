import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(title: Text('VOA News'), centerTitle: true),
      url: url,
      withJavascript: true,
      initialChild: Center(child: CircularProgressIndicator()),
    );
  }
}
