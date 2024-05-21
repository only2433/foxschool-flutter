
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../common/Common.dart';
import '../../../values/AppColors.dart';
class GamsStarwordsScreen extends StatefulWidget {
  final String starwordsID;
  final String accessToken;
  const GamsStarwordsScreen({
    super.key,
    required this.starwordsID,
    required this.accessToken});

  @override
  State<GamsStarwordsScreen> createState() => _GamsStarwordsScreenState();
}

class _GamsStarwordsScreenState extends State<GamsStarwordsScreen> {
  late InAppWebViewController _webViewController;
  bool isInAppWebViewReady = false;
  bool isWebViewLoadingComplete = false;


  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
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


         // await _webViewController.clearCache();
        //  await _webViewController.loadData(data: "");

          await SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
          await Future.delayed(Duration(milliseconds: Common.DURATION_SHORTER),() {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
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
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: isInAppWebViewReady == true ? InAppWebView(
                      initialUrlRequest: URLRequest(
                          url: Uri.parse(Common.URL_GAME_STARWORDS + widget.starwordsID),
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
                        await Future.delayed(const Duration(milliseconds:  Common.DURATION_LONG), () {
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
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {


    super.dispose();
  }
}
