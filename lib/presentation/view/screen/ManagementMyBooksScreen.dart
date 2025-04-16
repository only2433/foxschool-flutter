
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/data/model/management/ManagementMyBooksData.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/enum/MyBooksColorType.dart';
import 'package:foxschool/presentation/controller/management/ManagementMyBooksFactoryController.dart';
import 'package:foxschool/presentation/controller/management/river_pod/ManagementMyBooksUINotifier.dart';
import 'package:foxschool/presentation/view/widget/LightBlueTextButton.dart';
import 'package:foxschool/presentation/view/widget/OutlinedTextButton.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/TopTitleButtonType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/TopTitleView.dart';

class ManagementMyBooksScreen extends ConsumerStatefulWidget {

  final ManagementMyBooksData data;
  const ManagementMyBooksScreen({
    super.key,
    required this.data});

  @override
  ManagementMyBooksScreenState createState() => ManagementMyBooksScreenState();
}

class ManagementMyBooksScreenState extends ConsumerState<ManagementMyBooksScreen> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  late ManagementMyBooksFactoryController _factoryController;
  late FocusNode _focusNode;


  @override
  void initState() {
    super.initState();

    _factoryController = ManagementMyBooksFactoryController(
        context: context,
        myBooksData: widget.data,
        widgetRef: ref);
    _factoryController.init();
    _settingFocusNode();
  }

  void _settingFocusNode()
  {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {

      });
    });
  }

  void _disposeFocusNode(){
    _focusNode.dispose();
  }



  @override
  Widget build(BuildContext context) {

    final state = ref.watch(managementMyBooksUINotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.color_1fb77c,
        child: SafeArea(
          child: Column(
            children: [
              TopTitleView(
                title: state.title,
                type: TopTitleButtonType.CLOSE,
                onPressed: () {
                  _factoryController.onBackPressed();
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: CommonUtils.getInstance(context).getHeight(114),
                color: AppColors.color_edeef2,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: CommonUtils.getInstance(context).getWidth(42)
                  ),
                  child: RobotoNormalText(
                    text: getIt<FoxschoolLocalization>().data['message_maximum_bookshelf'],
                    fontSize: CommonUtils.getInstance(context).getWidth(38),
                    color: AppColors.color_444444,
                  )
                ),
              ),
              Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: AppColors.color_ffffff,
                    child: Column(
                      children: [
                        _buildTextFieldLayout(state.bookName),
                        _buildSelectBooksColorLayout(),

                        LightBlueTextButton(
                          width: CommonUtils.getInstance(context).getWidth(880),
                          height: CommonUtils.getInstance(context).getHeight(120),
                            text: getIt<FoxschoolLocalization>().data['text_save'],
                            onPressed: () {
                              _focusNode.unfocus();
                              _factoryController.onClickSaveButton(_textEditingController.text);
                            },
                        ),
                        SizedBox(
                          height: CommonUtils.getInstance(context).getHeight(50),
                        ),
                        OutlinedTextButton(
                            width: CommonUtils.getInstance(context).getWidth(880),
                            height: CommonUtils.getInstance(context).getHeight(120),
                            text: state.buttonText,
                            color: AppColors.color_29b8c6,
                            onPressed: () {
                              _focusNode.unfocus();
                              _factoryController.onClickCancelButton();
                            },)
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldLayout(String name)
  {
    _textEditingController.text = name;
    return Form(
        key: _formkey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: CommonUtils.getInstance(context).getHeight(220),
          alignment: Alignment.center,
          child: SizedBox(
            width: CommonUtils.getInstance(context).getWidth(884),
            height: CommonUtils.getInstance(context).getHeight(120),
            child: TextFormField(
              key: const ValueKey(1),
              focusNode: _focusNode,
              controller: _textEditingController,
              keyboardType: TextInputType.text,
              inputFormatters: [
                LengthLimitingTextInputFormatter(15)
              ],
              decoration: InputDecoration(
                fillColor: AppColors.color_ffffff,
                filled: true,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(35)),
                  child: Image.asset('assets/image/btn_tex_del.png',
                    width: CommonUtils.getInstance(context).getWidth(60),
                    height: CommonUtils.getInstance(context).getHeight(60)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(CommonUtils.getInstance(context).getWidth(15))
                  ),
                  borderSide: BorderSide(
                    color: AppColors.color_999999,
                    width: CommonUtils.getInstance(context).getWidth(1)
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(CommonUtils.getInstance(context).getWidth(15))
                  ),
                  borderSide: BorderSide(
                    color: AppColors.color_29c8e6,
                    width: CommonUtils.getInstance(context).getWidth(1)
                  )
                ),
                contentPadding: EdgeInsets.only(
                    top: CommonUtils.getInstance(context).getHeight(3),
                    left: CommonUtils.getInstance(context).getWidth(30)
                ),
                hintText: getIt<FoxschoolLocalization>().data['message_edit_maximum_text'],
                hintStyle: TextStyle(
                  color: AppColors.color_cccccc,
                  fontWeight: FontWeight.normal,
                  fontSize: CommonUtils.getInstance(context).getWidth(42),
                  fontFamily: 'Roboto'
                )
              ),
            ),
          ),
        )
    );
  }

  Widget _buildSelectBooksColorLayout()
  {
    final state = ref.watch(managementMyBooksUINotifierProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(166),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    _factoryController.onSelectBookColor(MyBooksColorType.RED);
                  },
                  child: Image.asset('assets/image/bookshelf_01.png',
                      width: CommonUtils.getInstance(context).getWidth(94),
                      height: CommonUtils.getInstance(context).getHeight(106)
                  ),
                ),
                Positioned(
                  left: CommonUtils.getInstance(context).getWidth(20),
                  top: CommonUtils.getInstance(context).getHeight(15),
                  child: state.colorType == MyBooksColorType.RED ? Image.asset('assets/image/icon_select.png',
                      width: CommonUtils.getInstance(context).getWidth(54),
                      height: CommonUtils.getInstance(context).getHeight(54))
                      : Container(),
                ),
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    _factoryController.onSelectBookColor(MyBooksColorType.ORANGE);
                  },
                  child: Image.asset('assets/image/bookshelf_02.png',
                      width: CommonUtils.getInstance(context).getWidth(94),
                      height: CommonUtils.getInstance(context).getHeight(106)
                  ),
                ),
                Positioned(
                  left: CommonUtils.getInstance(context).getWidth(20),
                  top: CommonUtils.getInstance(context).getHeight(15),
                  child: state.colorType == MyBooksColorType.ORANGE ? Image.asset('assets/image/icon_select.png',
                      width: CommonUtils.getInstance(context).getWidth(54),
                      height: CommonUtils.getInstance(context).getHeight(54))
                      : Container(),
                ),
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    _factoryController.onSelectBookColor(MyBooksColorType.GREEN);
                  },
                  child: Image.asset('assets/image/bookshelf_03.png',
                      width: CommonUtils.getInstance(context).getWidth(94),
                      height: CommonUtils.getInstance(context).getHeight(106)
                  ),
                ),
                Positioned(
                  left: CommonUtils.getInstance(context).getWidth(20),
                  top: CommonUtils.getInstance(context).getHeight(15),
                  child: state.colorType == MyBooksColorType.GREEN ? Image.asset('assets/image/icon_select.png',
                      width: CommonUtils.getInstance(context).getWidth(54),
                      height: CommonUtils.getInstance(context).getHeight(54))
                      : Container(),
                ),
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    _factoryController.onSelectBookColor(MyBooksColorType.BLUE);
                  },
                  child: Image.asset('assets/image/bookshelf_04.png',
                      width: CommonUtils.getInstance(context).getWidth(94),
                      height: CommonUtils.getInstance(context).getHeight(106)
                  ),
                ),
                Positioned(
                  left: CommonUtils.getInstance(context).getWidth(20),
                  top: CommonUtils.getInstance(context).getHeight(15),
                  child: state.colorType == MyBooksColorType.BLUE ? Image.asset('assets/image/icon_select.png',
                      width: CommonUtils.getInstance(context).getWidth(54),
                      height: CommonUtils.getInstance(context).getHeight(54))
                      : Container(),
                ),
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    _factoryController.onSelectBookColor(MyBooksColorType.PURPLE);
                  },
                  child: Image.asset('assets/image/bookshelf_05.png',
                      width: CommonUtils.getInstance(context).getWidth(94),
                      height: CommonUtils.getInstance(context).getHeight(106)
                  ),
                ),
                Positioned(
                  left: CommonUtils.getInstance(context).getWidth(20),
                  top: CommonUtils.getInstance(context).getHeight(15),
                  child: state.colorType == MyBooksColorType.PURPLE ? Image.asset('assets/image/icon_select.png',
                      width: CommonUtils.getInstance(context).getWidth(54),
                      height: CommonUtils.getInstance(context).getHeight(54))
                      : Container(),
                ),
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    _factoryController.onSelectBookColor(MyBooksColorType.PINK);
                  },
                  child: Image.asset('assets/image/bookshelf_06.png',
                      width: CommonUtils.getInstance(context).getWidth(94),
                      height: CommonUtils.getInstance(context).getHeight(106)
                  ),
                ),
                Positioned(
                  left: CommonUtils.getInstance(context).getWidth(20),
                  top: CommonUtils.getInstance(context).getHeight(15),
                  child: state.colorType == MyBooksColorType.PINK ? Image.asset('assets/image/icon_select.png',
                      width: CommonUtils.getInstance(context).getWidth(54),
                      height: CommonUtils.getInstance(context).getHeight(54))
                      : Container(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _disposeFocusNode();
    super.dispose();
  }
}
