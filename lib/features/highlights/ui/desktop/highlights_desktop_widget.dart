import 'package:flutter/material.dart';
import 'package:subham_jyoti_portfolio_flutter/design/buttons/app_outlined_button.dart';
import 'package:subham_jyoti_portfolio_flutter/design/constants/app_image.dart';
import 'package:subham_jyoti_portfolio_flutter/design/utils/app_colors.dart';
import 'package:subham_jyoti_portfolio_flutter/design/widgets/app_image_widget.dart';

class HighlightsDesktopWidget extends StatelessWidget {
  const HighlightsDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      // height: MediaQuery.of(context).size.height - 100,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
                BoxShadow(
                  blurRadius: 200,
                  spreadRadius: 200,
                  color: AppColors.purple.withOpacity(0.4),
                )
              ]),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    direction: Axis.horizontal,
                    children: [
                      highlightContainer(
                          context,
                          1,
                          false,
                          'About Me',
                          AppImages.bookmarkImage,
                          'I am an AI Engineer with a passion for research and development. I have a strong background in Machine Learning, Deep Learning, and Computer Vision. Aspire to be build my own products that can have a Postive Impact.',
                          'VISIT CHANNEL'),
                      highlightContainer(
                          context,
                          2,
                          true,
                          'Research',
                          AppImages.bulbImage,
                          'Collection of my own research work and Technical articles. ',
                          'VISIT CHANNEL'),
                      highlightContainer(
                          context,
                          2,
                          true,
                          'Paper To Code',
                          AppImages.cupImage,
                          'Contains implementaion of research paper wtih thier documentaion.',
                          'VISIT CHANNEL'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget highlightContainer(BuildContext context, num div, bool showButton, String topic,
      imagePath, text, buttonText) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w / div,
      height: 260,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.purpleDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImageWidget(
            imageWidth: 100,
            imageHeight: 100,
            path: imagePath,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic,
                  style: const TextStyle(
                      fontSize: 26, height: 1.4, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontSize: w / 80),
                ),
                const SizedBox(height: 10),
                if (showButton)
                  AppOutlinedButton(
                    title: buttonText,
                    textStyle: const TextStyle(fontSize: 12),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
