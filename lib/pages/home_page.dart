import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tests/views/final_view.dart';
import 'package:tests/widgets/widgets/card_spring_animation.dart';
import 'package:tests/widgets/widgets/cards_cascade_out.dart';
import 'package:tests/widgets/cards_stack.dart';
import 'package:tests/widgets/rotating_gradient_arc.dart';
import 'package:tests/widgets/stack_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff56a5b5),
          title: const Text(
            "Custom widgets",
            style: TextStyle(color: Colors.white),
          ),
        ),
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
          child: ListView.builder(
              itemCount: widgetsDemo.length,
              itemBuilder: (context, index) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff56a5b5),
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    child: ListTile(
                      title: GradientText(
                        widgetsDemo[index].name,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                        colors: const [
                          Color(0xffBA346D),
                          Color(0xff712C91),
                          Colors.teal,
                        ],
                      ), // Text(widgetsDemo[index].name),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: widgetsDemo[index].builder));
                      },
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  )),
        ));
  }
}

class Demo {
  String name;
  WidgetBuilder builder;

  Demo({required this.builder, required this.name});
}

List<Demo> widgetsDemo = [
  Demo(
      builder: (context) => const RotatingGradientArc(),
      name: "Rotating Gradient Arc"),

  Demo(builder: (context) => const FinalView(), name: "FinalView"),

  Demo(
      builder: (context) => const CardSpringAnimation(),
      name: "Fane out Cards"),
  Demo(
      builder: (context) => const CardsCascadeOut(), name: "Cascade out cards"),
  Demo(builder: (context) => const CardsStack(), name: "Stack cards"),
  Demo(builder: (context) => const StackList(), name: "Stack List"),
  //Demo(builder: (context) => const Bubles(), name: "Bubles"),
];
