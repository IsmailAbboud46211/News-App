import 'package:app_news/layout/shared/colors.dart';
import 'package:app_news/layout/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String? url;
  const WebViewContainer({
    Key? key,
    this.url,
  }) : super(key: key);

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late String? url = widget.url;
  bool _isLoding = false;
  bool _webResourceError = false;
  // ignore: prefer_typing_uninitialized_variables
  var controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              _isLoding = true;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _webResourceError = true;
            });
          },
        ),
      ) // This line to protect the app from the bad url
      ..loadRequest(Uri.parse(
        url!,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "The article",
          style: TextStyle(
            fontFamily: 'javanese-text',
          ),
        ),
      ),
      body: _isLoding
          ? WebViewWidget(
              controller: controller,
            )
          : _webResourceError == true
              ? errorWidget(height: height, width: width)
              : Center(
                  child: SizedBox(
                    width: width * 0.2,
                    height: height * 0.5,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                      colors: [
                        AppColors.deepBlue,
                        AppColors.babyBlue,
                        AppColors.softWhite,
                      ],
                      strokeWidth: 2,
                    ),
                  ),
                ),
    );
  }
}
