import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_filter_bloc.dart';
import '../bloc/search_filter_event.dart';
import '../bloc/search_filter_state.dart';

/// Horizontal list of category filter chips powered by SearchFilterBloc.
class SearchFilterChipsRow extends StatelessWidget {
  static const List<String> filters = [
    'All',
    'Pending',
    'In Progress',
    'Resolved',
    'Potholes',
    'Lighting',
  ];

  const SearchFilterChipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFilterBloc, SearchFilterState>(
      buildWhen: (prev, curr) => prev.selectedFilter != curr.selectedFilter,
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: filters.map((filter) {
              final isSelected = state.selectedFilter == filter;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(filter),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      context.read<SearchFilterBloc>().add(
                        ChangeSearchFilterEvent(filter),
                      );
                    }
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
