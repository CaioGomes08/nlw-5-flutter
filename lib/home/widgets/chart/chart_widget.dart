import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';

class ChartWidget extends StatefulWidget {
  final double percent;

  const ChartWidget({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation =
        Tween<double>(begin: 0.0, end: widget.percent).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Stack(
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    backgroundColor: AppColors.chartSecondary,
                    value: _animation.value,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${(_animation.value * 100).toInt()}%",
                  style: AppTextStyles.heading,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
