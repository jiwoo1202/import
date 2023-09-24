import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../components/components.dart';
import '../../util/font/font.dart';
import 'devnews_detail.dart';

class DevMain extends StatefulWidget {
  const DevMain({super.key});

  @override
  State<DevMain> createState() => _DevMainState();
}

class _DevMainState extends State<DevMain> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('최신순'),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.to(()=>DevDetail());
                        },
                        child: Container(
                          width: Get.width,
                          height: 285,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0,
                                blurRadius: 5.0,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: Get.width,
                                  height: 150,
                                  child: Image.asset('assets/image1.png',fit: BoxFit.fill,),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 14,right: 14),
                                  child: Row(
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 14),
                                  child: Text('개발정보 표시',style: f14Bw900,),
                                ),
                                Spacer(),
                                Container(
                                  width: Get.width,
                                  height: 27,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 14,right: 14),
                                    child: ListView.builder(
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: const ClampingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Container(
                                                width: 48,
                                                height:27,
                                                decoration:BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    color: Color(0xffEDEDED)
                                                ),
                                                child: Center(child: Text('태그임',style: f10Greyw900,))
                                            ),
                                            SizedBox(
                                              width: 8,
                                            )
                                          ],
                                        );
                                      },
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
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
