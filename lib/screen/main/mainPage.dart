import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:import_new_pr/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../firebase/firebase_test.dart';
import '../../util/font/font.dart';
import '../dev_news/devnews_main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List icon = [
    'assets/notice.png',
    'assets/homepage.png',
    'assets/calendar.png',
    'assets/event.png',
  ];
  List a = ['11','22','33'];
  DateTime focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  PageController pageController = PageController();
  int currentIdx = 0;

  @override
  void initState() {
    print('11');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0DD675),
        centerTitle: true,
        title: Text('IMPORT',style: f24white900,),
        actions: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: Get.width,
                    height: 179,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)
                    ),
                    child: PageView.builder(
                      itemCount: 3,
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (idx){
                        currentIdx = idx;
                        pageController.animateToPage(currentIdx, duration: Duration(seconds: 1), curve: Curves.fastEaseInToSlowEaseOut);
                      },
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 24),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.calendar_today_outlined,size: 42,),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${a[index]}',style: f240w900,),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text('2023.12.12 (화) ~ 2023.12.12 (월)',style: f14Greyw900,),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width:100,
                                        height:33,
                                        decoration: BoxDecoration(
                                          color: Color(0xffE8E8E8),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 20),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text('자세히',style: TextStyle(fontSize: 14),),
                                                Spacer(),
                                                Icon(Icons.arrow_forward_ios_outlined,size: 14,)
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        );
                      },
                      physics: const ClampingScrollPhysics(),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: SmoothPageIndicator(
                      controller:pageController,
                      count: 3,
                      onDotClicked: (index){
                        print(index);
                        currentIdx = index;
                        pageController.animateToPage(currentIdx, duration: Duration(microseconds: 300), curve: Curves.fastEaseInToSlowEaseOut);
                      },
                      effect: CustomizableEffect(
                        spacing: 10,
                        activeDotDecoration: DotDecoration(
                          width: 12,
                          height: 12,
                          color: Color(0xff0DD675),
                          rotationAngle: 180,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        dotDecoration: DotDecoration(
                          width: 12,
                          height: 12,
                          color: Color(0xffD1D1D1),
                          borderRadius: BorderRadius.circular(16),
                          verticalOffset: 0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconText(image: 'assets/notice.png', text: '공지사항',ontap: () {
                          print('111');
                        },),
                        Spacer(),
                        IconText(image: 'assets/homepage.png', text: '홈페이지',ontap: () {
                          print('111');
                        },),
                        Spacer(),
                        IconText(image: 'assets/calendar.png', text: '동아리 일정',ontap: () {
                          print('111');
                        },),
                        Spacer(),
                        IconText(image: 'assets/event.png', text: '이벤트',ontap: () {
                          print('111');
                        },)
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('개발 정보',style: f18Bw900,),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>DevMain());
                            },
                              child: Text('더보기',style: TextStyle(color: Color(0xff0DD675)),)),
                          Icon(Icons.arrow_forward_ios_outlined,size: 14,color: Color(0xff0DD675),)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      height: 150,
                      child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: Get.width*0.27,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      spreadRadius: 0,
                                      blurRadius: 5.0,
                                      offset: Offset(0, 10), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                        children: [
                                          Positioned(
                                              child: Container(
                                                height: 100,
                                                width: Get.width,
                                                child: Image.asset('assets/testimage.png',fit: BoxFit.fill,),
                                              )),
                                          Positioned(
                                              top:6,
                                              left:7,
                                              child: Container(
                                                width: 39,
                                                height:20,
                                                decoration:BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                  color: Color(0xffE5F8EB)
                                                ),
                                                child: Center(child: Text('111',style: f10Gw900,))
                                              ))
                                        ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4,right: 4),
                                      child: Text('dasdasdasdasdadadsadasdasdadadad'
                                        ,style: f10Bw900
                                        ,maxLines: 2
                                        ,overflow: TextOverflow.ellipsis,),
                                    )
                                  ],
                                ),
                              ),
                              index==2?Container():SizedBox(width: Get.width*0.04),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Q&A',style: f18Bw900,),
                              Spacer(),
                              Text('더보기',style: TextStyle(color: Color(0xff0DD675)),),
                              Icon(Icons.arrow_forward_ios_outlined,size: 14,color: Color(0xff0DD675),)
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: Get.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 0,
                                          blurRadius: 5.0,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                                width: 39,
                                                height:30,
                                                decoration:BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    color: Color(0xffE5F8EB)
                                                ),
                                                child: Center(child: Text('111',style: f12Gw900,))
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: Text('2323dsadasdasdasdasdasdadsdasdasdasdas'
                                                ,style: f14Bw900
                                                ,maxLines: 1,
                                                overflow: TextOverflow.ellipsis,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
