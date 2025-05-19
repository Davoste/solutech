import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:visit_tracker/core/constants/app_styles.dart';
import 'package:visit_tracker/presentation/providers/visit_provider.dart';
import 'package:visit_tracker/presentation/widgets/visit_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VisitProvider>(context);
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('MMMM yyyy').format(now);

    final List<String> weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    final List<DateTime> weekDates = List.generate(7, (index) {
      return now.add(Duration(days: index - (now.weekday - 1)));
    });

    final List<String> dates =
        weekDates.map((date) => date.day.toString()).toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            color: AppStyles.primaryColor.withOpacity(0.8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedDate,
                        style: AppStyles.headerText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      final isToday =
                          weekDates[index].day == now.day &&
                          weekDates[index].month == now.month &&
                          weekDates[index].year == now.year;
                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color:
                                isToday
                                    ? AppStyles.accentColor
                                    : Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                weekdays[index],
                                style: AppStyles.bodyText.copyWith(
                                  color:
                                      isToday ? Colors.black87 : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                dates[index],
                                style: AppStyles.bodyText.copyWith(
                                  color:
                                      isToday ? Colors.black87 : Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                provider.isLoading
                    ? const Center(
                      child: CircularProgressIndicator(
                        color: AppStyles.primaryColor,
                      ),
                    )
                    : provider.error != null
                    ? Center(
                      child: Text(provider.error!, style: AppStyles.bodyText),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: provider.visits.length,
                      itemBuilder: (context, index) {
                        return VisitCard(visit: provider.visits[index]);
                      },
                    ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add-visit'),
        backgroundColor: AppStyles.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
