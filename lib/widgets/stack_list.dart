import 'package:flutter/material.dart';
import 'package:tests/widgets/stack_item.dart';

class StackList extends StatefulWidget {
  const StackList({super.key});

  @override
  State<StackList> createState() => _StackListState();
}

class _StackListState extends State<StackList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Background.png'), fit: BoxFit.cover),
          gradient: LinearGradient(
            colors: [
              Color(0xff56a5b5),
              Color(0xffc3cfe2)
            ], // Start and end colors
          ),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => const StackItem()))
            ],
          ),
        ),
      ),
    );
  }
}
