import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Olá, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: 'Caio Gomes',
                              style: AppTextStyles.titleBold,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://avatars.githubusercontent.com/u/27794966?s=400&u=fbb23bb88803098ffa43e380a0b06505f63045b3&v=4'),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  ),
                ),
                Align(alignment: Alignment(0.0, 1.0), child: ScoreCardWidget())
              ],
            ),
          ),
        );
}
