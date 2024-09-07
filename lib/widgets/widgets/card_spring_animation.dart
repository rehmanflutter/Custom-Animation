import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tests/images.dart';
import 'package:tests/widgets/card_box.dart';
import 'package:tests/widgets/widgets/rotating_arcs.dart';
//import 'dart:math' as math;

class CardSpringAnimation extends StatefulWidget {
  const CardSpringAnimation({super.key});

  @override
  State<CardSpringAnimation> createState() => _CardSpringAnimationState();
}

class _CardSpringAnimationState extends State<CardSpringAnimation>
    with TickerProviderStateMixin {
  late AnimationController cardsAnimation = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));
  List<double> cardsMoves = List.filled(4, -75);
  List<double> endAngles = [-0.3, -0.2, -0.1, 0];
  List<double> beginAngles = [-0.3, -0.2, -0.1, 0];
  int pressCount = 0;

  void _onLongPress() {
    if (pressCount < 1) {
      pressCount = 1;
      setState(() {
        cardsMoves[3] = -95;
        for (int i = 2; i >= 0; i--) {
          cardsMoves[i] = cardsMoves[i + 1] + 30;
          endAngles[i] = endAngles[i + 1] + 0.2;
        }
      });
    } else if (pressCount == 1) {
      setState(() {
        cardsMoves[3] = -150;
        for (int i = 2; i >= 0; i--) {
          cardsMoves[i] = cardsMoves[i + 1] + 95;
        }
        for (int i = 0; i < endAngles.length - 1; i++) {
          endAngles[i] = 0.2;
        }
      });
    }
  }

  // Image URLs for each card
  List<String> imageUrls = [
    Images.g5,
    Images.g1,
    Images.g3,
    Images.g4,
    Images.g2
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff56a5b5),
        title: GradientText(
          'rehmanflutter1@gmail.com',
          style: const TextStyle(
            fontSize: 24.0,
          ),
          colors: const [
            Color(0xffBA346D),
            Color(0xff712C91),
            Colors.teal,
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          //image: DecorationImage(image: AssetImage('images/backimage.png'),fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          gradient: LinearGradient(
            colors: [
              Color(0xff56a5b5),
              Color(0xffc3cfe2)
            ], // Start and end colors
          ),
        ),
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onLongPress: _onLongPress,
                onLongPressEnd: (details) {
                  Future.delayed(
                      const Duration(milliseconds: 300),
                      () => setState(() {
                            cardsMoves = List.filled(4, -75);
                            endAngles = [-0.3, -0.2, -0.1, 0];
                          }));
                  Future.delayed(
                      const Duration(milliseconds: 900),
                      () => setState(() {
                            pressCount = 0;
                          }));
                },
                child: SizedBox(
                  width: width,
                  height: 400,
                  child: Stack(
                      alignment: Alignment.center,
                      children: List.generate(
                        4,
                        (index) => TweenAnimationBuilder(
                            tween: Tween<double>(
                                begin: (width / 2) - 75,
                                end: (width / 2) + cardsMoves[index]),
                            duration: const Duration(milliseconds: 300),
                            builder: (context, left, child) {
                              return Positioned(
                                left: left,
                                child: TweenAnimationBuilder(
                                    tween: Tween<double>(
                                        begin: beginAngles[index],
                                        end: endAngles[index]),
                                    duration: const Duration(milliseconds: 300),
                                    builder: (context, angle, child) {
                                      return GestureDetector(
                                        child: CardBox(
                                          height: 200,
                                          width: 150,
                                          angle: angle,
                                          image: imageUrls[index],
                                        ),
                                      );
                                    }),
                              );
                            }),
                      )),
                ),
              ),
            ),
            RotatingArcs(),
          ],
        ),
      ),
    );
  }
}

class FlowCardDelegate extends FlowDelegate {
  final Animation<double> cardsAnimation;
  FlowCardDelegate({required this.cardsAnimation})
      : super(repaint: cardsAnimation);
  @override
  void paintChildren(FlowPaintingContext context) {
    int childCount = context.childCount;
    double baseX =
        (context.size.width / 2) - context.getChildSize(0)!.width / 2;
    double y = (context.size.height / 2) - context.getChildSize(0)!.height;

    if (cardsAnimation.status == AnimationStatus.forward) {
      double firstx = (context.size.width / 2) - 5;
      double firstz = 0.6;

      for (int i = 0; i < childCount; i++) {
        context.paintChild(i,
            transform: Matrix4.translationValues(
                (firstx - (30 * i)) * cardsAnimation.value,
                y,
                (firstz - (0.2 * i) * cardsAnimation.value)));
      }
    } else {
      double firstz = -0.3;
      for (int i = 0; i < childCount; i++) {
        context.paintChild(i,
            transform: Matrix4.translationValues((baseX) * cardsAnimation.value,
                y, (firstz + (0.1 * i) * cardsAnimation.value)));
      }
    }
  }

  @override
  bool shouldRepaint(FlowCardDelegate oldDelegate) {
    return cardsAnimation != oldDelegate.cardsAnimation;
  }
}
