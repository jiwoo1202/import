import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../components/components.dart';
import '../../util/code.dart';
import '../../util/font/font.dart';

class DevDetail extends StatefulWidget {
  const DevDetail({super.key});

  @override
  State<DevDetail> createState() => _DevMainState();
}


class _DevMainState extends State<DevDetail> {
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
      appBar: AppBars(appBar: AppBar()),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      width: 48,
                      height:27,
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffE5F8EB)
                      ),
                      child: Center(child: Text('교육',style: f10Gw900,))
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text('작성자',style: f14Bw900,),
                  SizedBox(
                    width: 4,
                  ),
                  Text('${DateFormat('yyyy.MM.dd').format(DateTime.parse('${DateTime.now()}'))}'),
                  Spacer(),
                  Text('수정'),
                  SizedBox(
                    width: 4,
                  ),
                  Text('삭제')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('title',style: f320w900,),
              SizedBox(
                height: 14,
              ),
              Container(
                width: Get.width,
                height: 180,
                child: Image.asset('assets/image1.png',fit: BoxFit.fill,),
              ),
              SizedBox(
                height: 14,
              ),
              Text('contextddasdasdaddaa'),
              SizedBox(
                height: 24,
              ),
              Text('댓글',style: f16Bw900,),
              SizedBox(
                height: 14,
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text('작성자',style: f14Bw900,),
                          SizedBox(
                            width: 7,
                          ),
                          Text('${DateFormat('yyyy.MM.dd').format(DateTime.parse('${DateTime.now()}'))}'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width:Get.width,
                        child: MarkdownBody(
                            key: const Key("defaultmarkdownformatter"),
                            data: markdownText,
                            selectable: true,
                            // padding: const EdgeInsets.all(10),
                            builders: {
                              'code': CodeElementBuilder(),
                            }),
                      ),
                      SizedBox(
                        height: 14,
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
