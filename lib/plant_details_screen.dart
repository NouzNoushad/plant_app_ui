import 'package:flutter/material.dart';
import 'package:plant_app_ui/constants.dart';

class PlantDetailsScreen extends StatefulWidget {
  const PlantDetailsScreen({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  State<PlantDetailsScreen> createState() => _PlantDetailsScreenState();
}

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  int selectedIndex = 2;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(86, 130, 92, 1),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: ListView.separated(
                        padding: const EdgeInsets.all(10),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
                              child: selectedIndex == index
                                  ? CustomPaint(
                                      painter: EdgeCuts(),
                                      child: Image.asset(
                                        'assets/${plants[index]}.png',
                                        height: 95,
                                      ),
                                    )
                                  : Image.asset(
                                      'assets/${plants[index]}.png',
                                      height: 95,
                                    ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 25,
                            ),
                        itemCount: plants.length),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/leaf${selectedIndex + 1}.png',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Maku rela Vera",
                            style: TextStyle(
                              fontSize: 28,
                              color: Color.fromRGBO(229, 220, 165, 1),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "\$19.00",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(229, 220, 165, 1),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Succulents from the Tilandsia family are some of the easiest to care for - outside of an occasional misting",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class EdgeCuts extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    var path = Path()
      ..moveTo(w * 1.15, h * -0.28)
      ..quadraticBezierTo(w * 1.1, h * -0.09, w * 1, h * -0.1)
      ..lineTo(w * 0.08, h * -0.1)
      ..quadraticBezierTo(w * -0.01, h * -0.05, w * 0.0, h * 0.05)
      ..lineTo(w * 0.0, h * 0.95)
      ..quadraticBezierTo(w * -0.01, h * 1.1, w * 0.08, h * 1.15)
      ..lineTo(w * 1, h * 1.15)
      ..quadraticBezierTo(w * 1.1, h * 1.15, w * 1.15, h * 1.3);
    canvas.drawPath(
        path,
        Paint()
          ..color = const Color.fromRGBO(86, 130, 92, 1)
          ..strokeWidth = 3
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
