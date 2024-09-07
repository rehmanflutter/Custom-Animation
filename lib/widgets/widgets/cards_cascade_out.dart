import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tests/images.dart';
import 'package:tests/widgets/card_box.dart';

class CardsCascadeOut extends StatefulWidget {
  const CardsCascadeOut({super.key});

  @override
  State<CardsCascadeOut> createState() => _CardsCascadeOutState();
}

class _CardsCascadeOutState extends State<CardsCascadeOut>
    with TickerProviderStateMixin {
  List<double> cardsLeftMoves = List.filled(5, -75);
  List<double> endAngles = [-0.4, -0.3, -0.2, -0.1, 0];
  List<double> beginAngles = [-0.4, -0.3, -0.2, -0.1, 0];
  List<double> cardsTopMoves = List.filled(5, -200);
  List<Size> cardsSize = List.filled(
    5,
    const Size(150, 200),
  );

  // Image URLs for each card
  List<String> imageUrls = [
    Images.g5,
    Images.g1,
    Images.g3,
    Images.g4,
    Images.g2
  ];

  void _onLongPress(double width, double height) {
    setState(() {
      cardsLeftMoves[3] = (-width / 2) + 10;
      cardsTopMoves[4] = -220;
      for (int i = 2; i >= 0; i--) {
        cardsLeftMoves[i] = cardsLeftMoves[i + 1] + 110;
      }
      for (int i = 0; i < endAngles.length - 1; i++) {
        endAngles[i] = 0;
      }
      for (int i = 0; i < cardsTopMoves.length - 1; i++) {
        cardsTopMoves[i] = 10;
      }
      for (int i = 0; i < cardsSize.length - 1; i++) {
        cardsSize[i] = const Size(100, 150);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          image: DecorationImage(
              image: AssetImage('images/Background.png'), fit: BoxFit.cover),

          //image: DecorationImage(image: AssetImage('images/backimage.png'),fit: BoxFit.cover),

          gradient: LinearGradient(
            colors: [
              Color(0xff56a5b5),
              Color(0xffc3cfe2)
            ], // Start and end colors
          ),
        ),
        child: Center(
          child: GestureDetector(
            onLongPress: () {
              _onLongPress(width, height);
            },
            onLongPressEnd: (details) {
              setState(() {
                cardsLeftMoves = List.filled(5, -75);
                endAngles = [-0.4, -0.3, -0.2, -0.1, 0];
                cardsTopMoves = List.filled(5, -200);
                cardsSize = List.filled(
                  5,
                  const Size(150, 200),
                );
              });
            },
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                  alignment: Alignment.center,
                  children: List.generate(
                    cardsLeftMoves.length,
                    (index) => TweenAnimationBuilder(
                        tween: Tween<double>(
                            begin: (height / 2) - 200,
                            end: (height / 2) + cardsTopMoves[index]),
                        duration: const Duration(milliseconds: 300),
                        builder: (context, top, child) {
                          return TweenAnimationBuilder(
                              tween: Tween<double>(
                                  begin: (width / 2) - 75,
                                  end: (width / 2) + cardsLeftMoves[index]),
                              duration: const Duration(milliseconds: 300),
                              builder: (context, left, child) {
                                return Positioned(
                                  left: left,
                                  top: top,
                                  child: TweenAnimationBuilder(
                                      tween: Tween<double>(
                                          begin: beginAngles[index],
                                          end: endAngles[index]),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      builder: (context, angle, child) {
                                        return TweenAnimationBuilder(
                                            tween: Tween<Size>(
                                                begin: const Size(150, 200),
                                                end: cardsSize[index]),
                                            duration: const Duration(
                                                milliseconds: 300),
                                            builder: (context, size, child) {
                                              return CardBox(
                                                height: size.height,
                                                width: size.width,
                                                angle: angle,
                                                image: imageUrls[index],
                                              );
                                            });
                                      }),
                                );
                              });
                        }),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
