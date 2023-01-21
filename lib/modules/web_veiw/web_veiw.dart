import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class web_veiw extends StatelessWidget {
  final String url;
  web_veiw({required this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.navigate_before_outlined,
              size: 40,
            )),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: WebView(
            initialUrl: url,
          ),
        ),
      ],
    ));
  }
}
