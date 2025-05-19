import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visit_tracker/core/constants/app_styles.dart';
import 'package:visit_tracker/core/network/api_client.dart';
import 'package:visit_tracker/data/repositories/visit_repository_impl.dart';

import 'package:visit_tracker/domain/usecases/add_visit.dart';
import 'package:visit_tracker/domain/usecases/get_visits.dart';
import 'package:visit_tracker/presentation/pages/add_visit_page.dart';
import 'package:visit_tracker/presentation/pages/home_page.dart';
import 'package:visit_tracker/presentation/providers/visit_provider.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(http.Client());
    final visitRepository = VisitRepositoryImpl(apiClient);
    final getVisits = GetVisits(visitRepository);
    final addVisit = AddVisit(visitRepository);

    return ChangeNotifierProvider(
      create: (_) => VisitProvider(getVisits, addVisit)..fetchVisits(),
      child: MaterialApp(
        title: 'Visits Tracker',
        theme: ThemeData(
          primaryColor: AppStyles.primaryColor,
          scaffoldBackgroundColor: Colors.transparent,
          textTheme: GoogleFonts.oswaldTextTheme(), // Apply Oswald globally
        ),
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: BoxDecoration(gradient: AppStyles.backgroundGradient),
          child: const HomePage(),
        ),
        routes: {
          '/add-visit':
              (context) => Container(
                decoration: BoxDecoration(
                  gradient: AppStyles.backgroundGradient,
                ),
                child: const AddVisitPage(),
              ),
          '/visit/:id':
              (context) => Container(
                decoration: BoxDecoration(
                  gradient: AppStyles.backgroundGradient,
                ),
                child: const Scaffold(
                  body: Center(child: Text('Visit Details')),
                ),
              ),
        },
      ),
    );
  }
}
