import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/deals_model.dart';
import 'package:flutter_ecommerce_app/view_model/deals_view_model.dart';
import 'package:flutter_ecommerce_app/views/shared/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/views/shared/utils/custom_box_decoration.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ListViewScreen extends StatefulWidget {
  final int tabIndex;
  const ListViewScreen({required this.tabIndex, super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  DealsViewModels? dealsViewmodels;
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print('get index of page >>>> ${widget.tabIndex}');

    _scrollController.addListener(() {
      // Highlight: Listen for scroll events
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        // Highlight: Check if user is near the bottom
        if (!isLoading) {
          getNextPageDealsData(); // Trigger data loading
        }
      }
    });

    // Call the API using Provider with mounted check
    Future.microtask(() {
      print('Future.microtask Performed');
      if (mounted) {
        Provider.of<DealsViewModels>(context, listen: false)
            .getDealsData(widget.tabIndex);
      }
    });
  }

  Future<void> _refreshData() async {
    Provider.of<DealsViewModels>(context, listen: false)
        .getDealsData(widget.tabIndex, isRefresh: true);
    print('Refreshed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DealsViewModels>(builder: (context, value, child) {
        return RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: value.listViewData.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return listViewContainer(value.listViewData[index], index);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12,
              );
            },
          ),
        );
      }),
    );
  }

  getNextPageDealsData() {
    isLoading = true;

    isLoading
        ? Provider.of<DealsViewModels>(context, listen: false)
            .getDealsData(widget.tabIndex, isNextPage: true)
        : null;
  }

  Widget listViewContainer(Deal dealData, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: CustomBoxDecoration.dealsListTileDecoration,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    child: Image.network(
                      '${dealData.imageMedium}',
                      height: 80,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${dealData.id}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.color_primary_black),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            children: [
                              Text(
                                'Rs 500',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.color_primary_green),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Rs 600', // Original price
                                style: TextStyle(
                                  fontSize: 16, // Font size
                                  color: Colors
                                      .grey, // Grey color for the strikethrough text
                                  decoration: TextDecoration
                                      .lineThrough, // Line through the text
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '17% Off',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.color_primary_red),
                              ),
                            ],
                          ),
                        ),
                        Text(dealData.store?.name ?? '',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.color_primary_black))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  iconWithText(lblString: '2', iconName: Icons.thumb_up),
                  iconWithText(
                      lblString: '${dealData.commentsCount}',
                      iconName: Icons.comment),
                  iconWithText(
                      // lblString:  '${dealData.createdAtInMillis ?? ''}',
                      lblString: returndateTime(dealData.createdAt),
                      iconName: Icons.av_timer),
                  const Spacer(),
                  Text('At Other',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.color_primary_blue))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String returndateTime(DateTime? dateTime) {
    return dateTime != null
        ? DateFormat('d MMM yyyy').format(dateTime)
        : ''; // Return an empty string if dateTime is null
  }

  Widget iconWithText({required String lblString, required IconData iconName}) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Row(
        children: [
          Icon(iconName),
          const SizedBox(
            width: 2,
          ),
          Text(
            lblString,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.color_grey),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up to avoid memory leaks
    super.dispose();
  }
}
