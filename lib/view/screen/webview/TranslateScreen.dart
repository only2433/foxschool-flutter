
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../common/Common.dart';
import '../../../common/FoxschoolLocalization.dart';
import '../../../di/Dependencies.dart';
import '../../../enum/TopTitleButtonType.dart';
import '../../../values/AppColors.dart';
import '../../widget/TopTitleView.dart';

class TranslateScreen extends StatefulWidget {
  final String translateID;
  final String accessToken;
  const TranslateScreen({
    super.key,
    required this.translateID,
    required this.accessToken});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  late InAppWebViewController _webViewController;
  bool isInAppWebViewReady = false;
  bool isWebViewLoadingComplete = false;


  @override
  void initState() {
    super.initState();

    isInAppWebViewReady = false;
    isWebViewLoadingComplete = false;
    Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
      setState(() {
        isInAppWebViewReady = true;
      });
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.color_1fb77c,
        child:SafeArea(
          child: Column(
            children: [
              TopTitleView(
                title: getIt<FoxschoolLocalization>().data['text_original_translate'],
                type: TopTitleButtonType.CLOSE,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        child: isInAppWebViewReady ? InAppWebView(
                          initialUrlRequest: URLRequest(
                            url: Uri.parse(Common.URL_ORIGIN_TRANSLATE + widget.translateID),
                            headers: {
                              "Authorization" : "Bearer ${widget.accessToken}",
                              "api-user-agent" : Common.TEST_USER_AGENT
                            }
                          ),
                          initialOptions: InAppWebViewGroupOptions(
                            android: AndroidInAppWebViewOptions(
                              useHybridComposition: true
                            )
                          ),
                          onLoadStart: (controller, url) {

                          },
                          onLoadStop: (controller, url) async{
                            await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG), () {
                              setState(() {
                                isWebViewLoadingComplete = true;
                              });
                            });
                          },
                          onWebViewCreated: (controller) {
                            _webViewController = controller;
                          },
                        ) : Container(),
                      ),
                      if(isWebViewLoadingComplete == false)
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.color_1fb77c,
                          ),
                        )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _webViewController.clearCache();
    super.dispose();
  }
}
