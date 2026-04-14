import 'package:easy_order/features/home/views/widgets/banner/home_banner.dart';
import 'package:easy_order/features/home/views/widgets/header/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(
                  onNotificationsTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Экран уведомлений в разработке'),
                      ),
                    );
                  },
                  onChatTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Экран чата в разработке')),
                    );
                  },
                ),
                const HomeBanner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
