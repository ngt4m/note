import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  final String? title;
  final String? body;
  final int? color;
  final VoidCallback? ontap;
  final VoidCallback? onlongpress;
  const NoteWidget(
      {Key? key,
      this.title,
      this.body,
      this.color,
      this.ontap,
      this.onlongpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      onLongPress: onlongpress,
      child: Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(color!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              body!,
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
