import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9E4F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF04063E)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "SCM",
          // style: TextStyle(
          //   fontFamily: 'Inter',
          //   fontWeight: FontWeight.w500,
          //   fontSize: 16,
          //   height: 24 / 16,
          //   color: Color(0xFF04063E),
          // ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF646984),
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 15,
                top: 12,

                child: Container(
                  width: 9,
                  height: 9,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDF2222),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.all(24),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFB6B8D0)),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Image.asset('assets/empty.png'),
            Text('No data is here,',style: TextStyle(
              color: Color(0xFF5E5E5E)
            ),),
            Text('please wait.',style: TextStyle(
                color: Color(0xFF5E5E5E)
            ),)
          ],
        ),
      ),
    );
  }
}
