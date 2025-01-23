import 'package:flutter/material.dart';

class CustomSomethingWrong extends StatefulWidget {
  final String issueTitle;
  const CustomSomethingWrong(
      {super.key, this.issueTitle = "Something went wrong!"});

  @override
  State<CustomSomethingWrong> createState() => _CustomSomethingWrongState();
}

class _CustomSomethingWrongState extends State<CustomSomethingWrong> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(seconds: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sentiment_dissatisfied,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Text(
              widget.issueTitle,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
