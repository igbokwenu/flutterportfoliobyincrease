import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterportfoliobyincrease/providers/theme_provider.dart';
import 'package:flutterportfoliobyincrease/views/widgets/portfolio_section.dart';
import 'package:flutterportfoliobyincrease/views/widgets/profile_section.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double widthSize = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Project Highlights')),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widthSize < 600
                  ? 20
                  : widthSize < 700
                      ? 50
                      : widthSize < 800
                          ? 70
                          : 150),
          child: const Column(
            children: [
              ProfileSection(),
              PortfolioSection(),
            ],
          ),
        ),
      ),
    );
  }
}

