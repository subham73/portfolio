
import 'package:flutter/material.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:subham_jyoti_portfolio_flutter/design/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsDesktopWidget extends StatelessWidget {
  const ContactUsDesktopWidget({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Divider(),
        const SizedBox(height: 20),
        const Text(
          'Contact Me',
          style: TextStyle(fontSize: 40),
        ),
        const SizedBox(height: 20),
        const Text(
            "If you are a student, entrepreneur or just want to chat with me, drop me an interesting mail at 👇"),
        const SizedBox(height: 8),
        Text(
          'akmadan1717@gmail.com',
          style: TextStyle(color: AppColors.purple),
        ),
        const SizedBox(height: 20),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              socialIcon('https://www.instagram.com/akshitmadan_/',
                  SocialIconsFlutter.instagram),
              socialIcon(
                  'https://github.com/akmadan', SocialIconsFlutter.github),
              socialIcon('https://www.linkedin.com/in/akshit-madan-394a82a6/',
                  SocialIconsFlutter.linkedin_box),
              socialIcon(
                  'https://www.youtube.com/channel/UCBlphb6_k7X1P28OCYXMsWg',
                  SocialIconsFlutter.youtube)
            ],
          ),
        ),
        // const Divider(),
        // const SizedBox(height: 20),
        // const Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text('Coded by Akshit with 💚 in India'),
            ],
          ),
        // )
      // ]),
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
