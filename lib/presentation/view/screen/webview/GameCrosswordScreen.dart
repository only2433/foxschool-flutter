
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/presentation/view/screen/webview/bridge/CrosswordWebviewBridge.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/values/AppColors.dart';

class GameCrosswordScreen extends StatefulWidget {
  final String crosswordID;
  final String accessToken;
  const GameCrosswordScreen({
    super.key,
    required this.crosswordID,
    required this.accessToken});

  @override
  State<GameCrosswordScreen> createState() => _GameCrosswordScreenState();
}

class _GameCrosswordScreenState extends State<GameCrosswordScreen> {
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

  void _setupJavaScriptHandlers()
  {
    _webViewController.addJavaScriptHandler(
        handlerName: Common.BRIDGE_NAME, callback: (arguments) {
          if(arguments.isNotEmpty)
            {

              String functionName = arguments[0];
              List<dynamic> params = arguments.sublist(1);
              Logcats.message("arguments[0] : ${arguments[0]}, params : $params");
              return CrosswordWebviewBridge(context: context).handle(functionName, params);
            }
          return null;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      url: Uri.parse(Common.URL_GAME_CROSSWORD + widget.crosswordID),
                      headers: {
                        "Authorization" : "Bearer ${widget.accessToken}",
                        "api-user-agent" : Common.TEST_USER_AGENT
                      }
                  ),

                  initialOptions: InAppWebViewGroupOptions(
                      android: AndroidInAppWebViewOptions(useHybridComposition: true)
                  ),
                  onLoadStart: (controller, url) {
                    Logcats.message("url : $url");
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

                    _webViewController.addJavaScriptHandler(handlerName: Common.BRIDGE_NAME, callback: (arguments) {

                      Logcats.message("arguments : ${arguments.toString()}");
                    },);
                    _webViewController.addWebMessageListener(WebMessageListener(jsObjectName: Common.BRIDGE_NAME, onPostMessage: (message, sourceOrigin, isMainFrame, replyProxy) {
                      Logcats.message("message : $message");
                    },));
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
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //_webViewController.clearCache();
    super.dispose();
  }

}
