import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:import_new_pr/util/color.dart';

import '../../util/code.dart';

class MypageMain extends StatefulWidget {
  const MypageMain({super.key});

  @override
  State<MypageMain> createState() => _MypageMainState();
}

class _MypageMainState extends State<MypageMain> {
  List picture = [
    'assets/notice.png',
    'assets/question.png',
    'assets/setting.png',
    'assets/exit.png',
  ];
  List title =[
    '공지사항',
    '문의하기',
    '설정',
    '로그아웃'
  ];

  final String markdownText = '**ㄴㅇㄹㄴㅁㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ**\n' +
      '~~ㅋㅌㅇㄹㅋㅌㄹ~~\n' +
      'ㅁㄴㅇㄹㅁㅂㅈㄷㄱ미나애두니;멈밷ㅈ\n' +
      '\n' +
      '```\n' +
      "var express = require('express');\n" +
      'var router = express.Router();\n' +
      '\n' +
      '/* GET home page. */\n' +
      "router.get('/', function(req, res, next) {\n" +
      "    res.render('index', { title: 'Express' });\n" +
      '});\n' +
      '\n' +
      'module.exports = router;\n' +
      '\n' +
      '```\n' +
      '\n' +
      '- ㅁㄴㅇㄹㄷㄴㅇㄹ\n' +
      '- ㅇㄹ\n' +
      '\n' +
      '- [ ] ㄴㅇㄹㅇㄴㄴㅇㄹ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('제목'),
          backgroundColor: Color(0xffEEEEEE),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: 130,
              child: Padding(
                padding: const EdgeInsets.only(left: 24,right: 24,top: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffE8E8E8))
                      ),
                      child: Center(child: Text('기본이미지')),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text('닉네임',style: TextStyle(fontSize: 16),),
                    Spacer(),
                    Text('회원정보 수정',style: TextStyle(fontSize: 16),),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,size: 14,)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),

            Container(
              width: Get.width,
              height: 500,
              child: Markdown(
                  key: const Key("defaultmarkdownformatter"),
                  data: markdownText,
                  selectable: true,
                  padding: const EdgeInsets.all(10),
                  builders: {
                    'code': CodeElementBuilder(),
                  }),
              // Markdown(data: markdownText,
              //     builders: {
              //       'code': CodeElementBuilder(),
              //     },
              //     styleSheet: MarkdownStyleSheet(
              //   //titleStyle
              //   h1:  TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w700),
              //   //sub
              //   h2: TextStyle(color: Colors.white, fontSize: 30),
              //   blockquoteDecoration: BoxDecoration(
              //       color: Colors.black
              //   ),
              //    code: TextStyle(
              //      color: Colors.white,
              //        backgroundColor: Colors.black
              //    ),
              //    codeblockDecoration: BoxDecoration(
              //      color: Colors.black
              //    ),
              // ),
              //
              // ),
            ),
            Expanded(
              child: Container(
                width: Get.width,
                height: Get.height,
                color: Color(0xffF4F5F9),
                child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 30,right: 30,top: 26),
                     child: Container(
                          width: Get.width,
                          height: 300,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(12)
                          ),
                       child: ListView.builder(
                          itemCount: 4,
                           shrinkWrap: true,
                           physics: const ClampingScrollPhysics(),
                           itemBuilder: (context,index){
                             return Column(
                               children: [
                                 Container(
                                     width: Get.width,
                                     height: 75,
                                     decoration: BoxDecoration(
                                         border: index ==3?null:Border(
                                           bottom: BorderSide( // POINT
                                             color: Colors.grey,
                                             width: 1.0,
                                           ),
                                         )
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.only(left: 20,right: 20),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Image.asset('${picture[index]}',width: 18,height: 18,),
                                           SizedBox(
                                             width: 8,
                                           ),
                                           Text('${title[index]}',style: TextStyle(fontSize: 16)),
                                           Spacer(),
                                           Icon(Icons.arrow_forward_ios_outlined,size: 14,)
                                         ],
                                       ),
                                     )),
                               ],
                             );
                           })
                     ),
                   )
                 ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
