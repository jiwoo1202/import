import 'package:flutter/material.dart';

import '../util/font/font.dart';

class IconText extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback ontap;
  const IconText({Key? key, required this.image, required this.text, required this.ontap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Image.asset('${image}'),
          SizedBox(
            height: 7,
          ),
          Text('${text}',style: f14Bw900,)
        ],
      ),
    );
  }
}

// class AppBars extends StatelessWidget {
//   const AppBars({Key? key}) : super(key: key);
//
//   @override
//   Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
//
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(56),
//       child: AppBar(
//         backgroundColor: Color(0xff0DD675),
//         centerTitle: true,
//         title: Text('IMPORT', style: TextStyle(fontSize: 24, color: Colors.white)),
//         actions: [],
//       ),
//     );
//   }
// }

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
  /// you can add more fields that meet your needs

  const AppBars({Key? key, required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff0DD675),
      centerTitle: true,
      title: Text('IMPORT', style: TextStyle(fontSize: 24, color: Colors.white)),
      actions: [],
    );
  }

}
