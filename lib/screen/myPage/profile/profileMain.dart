import 'package:flutter/material.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제목'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14,right: 14,top: 20),
        child: Column(
          children: [
            ListView.builder(
               itemCount: 2,
               shrinkWrap: true,
               physics: const ClampingScrollPhysics(),
               itemBuilder: (context, index) {
              return Container(
                child: Text('32131'),
              );
            }),
          ],
        ),
      )
    );
}}
