import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ez_ai_app/data/models/home/home_type.dart';

class HomeCard extends StatelessWidget {
  final HomeType type;
  final VoidCallback? onTap;

  const HomeCard({super.key, required this.type, this.onTap});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Card(
        color: Colors.blue.withOpacity(.2),
        elevation: 0,
        margin: EdgeInsets.only(bottom: mq.height * .02),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: type.onTap,
          child: type.leftAlign
              ? Row(
                  children: [
                    Container(
                      width: mq.width * .35,
                      padding: type.padding,
                      child: Lottie.asset(
                        'assets/lottie/${type.lottie}',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      type.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                )
              : Row(
                  children: [
                    const Spacer(flex: 2),
                    Text(
                      type.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                    const Spacer(flex: 2),
                    Container(
                      width: mq.width * .35,
                      padding: type.padding,
                      child: Lottie.asset(
                        'assets/lottie/${type.lottie}',
                      ),
                    ),
                  ],
                ),
        ));
  }
}
