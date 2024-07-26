import "package:flutter/material.dart";
import "package:rive/rive.dart";
import "package:social_media_flutter/widgets/icons.dart";
import "package:social_media_flutter/widgets/text.dart";
import "package:subham_jyoti_portfolio_flutter/design/constants/app_animations.dart";
import "package:subham_jyoti_portfolio_flutter/design/constants/app_image.dart";
import "package:subham_jyoti_portfolio_flutter/design/utils/app_colors.dart";
import "package:url_launcher/url_launcher.dart";

class IntroDesktopWidget extends StatefulWidget {
  const IntroDesktopWidget({super.key});

  @override
  State<IntroDesktopWidget> createState() => _IntroDesktopWidgetState();
}

class _IntroDesktopWidgetState extends State<IntroDesktopWidget> {

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(left: w / 30),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
              child: SizedBox(
                width: w/3, // Adjust the width as needed
                height: w/3, // Adjust the height as needed
                child: const RiveAnimation.asset(
                  AppAnimations.introAnimation,
                  animations: ['isHover', 'rotate', 'loop', 'scaleOn'],
                ),
             ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Row(
                children: [
                  Padding(
                padding: const EdgeInsets.only(top: 50), // Adjust the top padding as needed
                child: CircleAvatar(
                  radius: w / 14,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: w / 14 - 4,
                    backgroundImage: const AssetImage(AppImages.subhamjyoti_selfPic),
                  ),
                ),
              ),
                  const SizedBox(width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Preah',
                                fontSize: w / 40),
                            children: [
                              const TextSpan(text: 'I am '),
                              TextSpan(
                                  text: 'Subham Jyoti ',
                                  style: TextStyle(color: AppColors.purple))
                            ]),
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.2,
                                fontFamily: 'Preah',
                                fontSize: w / 20,
                                fontWeight: FontWeight.bold),
                            children: [
                              const TextSpan(text: 'Researcher \n'),
                              TextSpan(
                                  text: 'AI ',
                                  style: TextStyle(color: AppColors.purple)),
                              const TextSpan(text: 'Engineer \n'),
                              const TextSpan(text: 'Entrepreneur \n'),
                              TextSpan(
                                  text: '...',
                                  style: TextStyle(color: AppColors.purple)),
                            ]),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            socialIcon('https://www.instagram.com/akshitmadan_/',
                                SocialIconsFlutter.instagram),
                            socialIcon('https://github.com/akmadan',
                                SocialIconsFlutter.github),
                            socialIcon(
                                'https://www.linkedin.com/in/akshit-madan-394a82a6/',
                                SocialIconsFlutter.linkedin_box),
                            socialIcon(
                                'https://www.youtube.com/channel/UCBlphb6_k7X1P28OCYXMsWg',
                                SocialIconsFlutter.youtube)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
  Widget socialIcon(String link, IconData iconPath) {
    return HoverIcon(
      link: link,
      iconPath: iconPath,
      launchURL: _launchURL,
    );
  }
}

class HoverIcon extends StatefulWidget {
  final String link;
  final IconData iconPath;
  final Function(String) launchURL;

  const HoverIcon({
    required this.link,
    required this.iconPath,
    required this.launchURL,
    super.key,
  });

  @override
  _HoverIconState createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Transform.scale(
        scale: _isHovered ? 1.2 : 1.0,
        child: InkWell(
          onTap: () => widget.launchURL(widget.link),
          child: SocialWidget(
            placeholderText: '',
            iconData: widget.iconPath,
            iconColor: Colors.white,
            link: widget.link,
          ),
        ),
      ),
    );
  }
}