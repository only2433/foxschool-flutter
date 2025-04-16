
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:io';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/TopTitleButtonType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/TopTitleView.dart';

class EbookScreen extends StatefulWidget {
  final String ebookID;
  final String accessToken;
  const EbookScreen({
    super.key,
    required this.ebookID,
    required this.accessToken});

  @override
  State<EbookScreen> createState() => _EbookScreenState();
}

class _EbookScreenState extends State<EbookScreen> {
  late InAppWebViewController _webViewController;
  bool isInAppWebViewReady = false;
  bool isWebViewLoadingComplete = false;


  @override
  void initState() {
    super.initState();

    isInAppWebViewReady = false;
    isWebViewLoadingComplete = false;
    Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
      setState(() {
        isInAppWebViewReady = true;
      });
    },);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {

        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORTER),() {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ));
        },);

      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.color_1fb77c,
          child: SafeArea(
            child: Column(
              children: [
                TopTitleView(
                  title: getIt<FoxschoolLocalization>().data['text_ebook'],
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
                          child: isInAppWebViewReady == true ? InAppWebView(
                            initialUrlRequest: URLRequest(
                                url: Uri.parse(Common.URL_EBOOK + widget.ebookID),
                                headers: {
                                  "Authorization" : "Bearer ${widget.accessToken}",
                                  "api-locale" : Platform.localeName,
                                  "api-user-agent" : Common.TEST_USER_AGENT
                                }
                            ),
                            initialOptions: InAppWebViewGroupOptions(
                                android: AndroidInAppWebViewOptions(
                                    useHybridComposition: true
                                )
                            ),
                            onLoadStart: (controller, url) {
                              Logcats.message("url : $url");
                            },
                            onLoadStop: (controller, url) async {
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
                          const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.color_1fb77c,
                            ),
                          )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
