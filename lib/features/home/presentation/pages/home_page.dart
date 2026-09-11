import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../widgets/home_app_bar_title.dart';
import '../widgets/home_category_section.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/home_hero_banner_widget.dart';
import '../widgets/home_recent_reports_section.dart';
import '../widgets/home_summary_card.dart';

/// Citizen Home Dashboard reflecting Stitch Civic Modern UI architecture.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? userName;
    try {
      final state = context.watch<AuthBloc>().state;
      if (state is AuthenticatedState) userName = state.user.name;
    } catch (_) {}

    return Scaffold(
      appBar: AppBar(
        title: const HomeAppBarTitle(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () => context.push('/search'),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => context.push('/notifications'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeaderWidget(userName: userName),
              const SizedBox(height: 16),
              const HomeHeroBannerWidget(),
              const SizedBox(height: 16),
              const HomeSummaryCard(),
              const SizedBox(height: 20),
              const HomeCategorySection(),
              const SizedBox(height: 20),
              const HomeRecentReportsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
