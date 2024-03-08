import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/TopTitleButtonType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/view/widget/TopTitleWidget.dart';
import 'package:simple_loading_dialog/simple_loading_dialog.dart';

import '../../../common/Common.dart';
import '../../../di/Dependencies.dart';


class FoxschoolIntroduceScreen extends StatefulWidget {
  const FoxschoolIntroduceScreen({super.key});

  @override
  State<FoxschoolIntroduceScreen> createState() => _FoxschoolIntroduceScreenState();
}

class _FoxschoolIntroduceScreenState extends State<FoxschoolIntroduceScreen> {

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.color_47e1ad,
        child: SafeArea(
          child: Column(
            children: [
              TopTitleWidget(
                  title: getIt<FoxschoolLocalization>().data['text_foxschool_introduce'],
                  type: TopTitleButtonType.BACK,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
              ),
              Expanded(
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        child: InAppWebView(
                          initialUrlRequest: URLRequest(
                            url: Uri.parse(Common.URL_FOXSCHOOL_INTRODUCE),
                          ),
                          initialOptions: InAppWebViewGroupOptions(
                              android: AndroidInAppWebViewOptions(useHybridComposition: true)
                          ),
                          onLoadStart: (controller, url) {
                            print("onLoadStart");
                          },
                          onLoadStop: (controller, url) async{
                            print("onLoadStop");
                            await Future.delayed(Duration(seconds: 1));
                            setState(() {
                              isLoading = false;
                            });
                          },
                        ),
                      ),
                      if(isLoading)
                        Center(
                         child: CircularProgressIndicator(),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }


}
