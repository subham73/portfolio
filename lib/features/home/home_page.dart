import "package:flutter/material.dart";
import "package:subham_jyoti_portfolio_flutter/features/contact_us/ui/desktop/contact_us_desktop_widget.dart";
import "package:subham_jyoti_portfolio_flutter/features/highlights/ui/desktop/highlights_desktop_widget.dart";
import "package:subham_jyoti_portfolio_flutter/features/intro/ui/desktop/intro_desktop_widget.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // NavBarWidget(),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  IntroDesktopWidget(),
                  HighlightsDesktopWidget(),
                  // TechStackWidget(),
                  // VideosWidget(),
                  ContactUsDesktopWidget()
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}