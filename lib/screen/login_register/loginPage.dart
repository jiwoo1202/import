import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:import_new_pr/provider/user_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int a = 0;
  bool _isCheckLogin = false;
  @override
  void initState(){
    print('111111?');
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
        centerTitle: true,
        backgroundColor: Color(0xffEEEEEE),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff7E8388)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0DD675))
                    ),
                    hintText: '이메일',
                  ),
                  style: TextStyle(
                      color: Colors.black
                  ),
                  controller: emailController,
                  onChanged: (v){
                    setState(() {
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff7E8388)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0DD675))
                    ),
                    hintText: '비밀번호',
                  ),
                  style: TextStyle(
                      color: Colors.black
                  ),
                  controller: passwordController,
                  onChanged: (v){
                    setState(() {
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _isCheckLogin,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: Color(0xff0DD675),
                      checkColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          _isCheckLogin = value!;
                        });
                      },

                    ),
                  ),
                  Text("이메일 저장")
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(onPressed: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SecondPage(ID: emailController.text,Password: passwordController.text,)),
                  // );
                },style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xff0DD675), elevation: 5,textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))
                ), child: Text('로그인')),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(onPressed: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SecondPage(ID: emailController.text,Password: passwordController.text,)),
                  // );
                },style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Color(0xffFEE500), elevation: 5,textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                ), child: Text('카카오 로그인')),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: 110,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('회원가입',style: TextStyle(color: Colors.black),textAlign: TextAlign.start,),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('1111');
                    },
                    child: Container(
                      width: 110,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('이메일 찾기',style: TextStyle(color: Colors.black),textAlign: TextAlign.start,),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      await test1();
                    },
                    child: Container(
                      width: 110,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('비밀번호 찾기',style: TextStyle(color: Colors.black),textAlign: TextAlign.start,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> test() async {
    print('3232');
    final url = 'http://localhost:4000/post/edit';
    final body = {
      'title':'first',
      'content':'22',
      'tagF':'',
      'tagS':'',
      'tagT':'',
      'category':'notice',
      'topic':'',
      'userId':1
    };
    final response = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},
        body: jsonEncode(body));
        print('바디 :: ? ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Failed to send email');
    }
  }
  Future<void> test1() async {
    final us = Get.put(UserState());
    print('3232');
    final url = 'http://localhost:4000/post?category=notice';
    final response = await http.get(Uri.parse(url), headers: {"Content-Type": "application/json"},);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<Map<String, dynamic>> userList = List<Map<String, dynamic>>.from(jsonData['item']);
    us.userList.value = userList;
    print('바디222 :: ? ${us.userList[0]['id']}');
    if (response.statusCode != 200) {
      throw Exception('Failed to send email');
    }
  }
}
