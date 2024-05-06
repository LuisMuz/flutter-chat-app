import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap, required this.textButton});

  final void Function()? onTap;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

/*
    fixedSize: Size(size.width * .8, 45),
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
*/