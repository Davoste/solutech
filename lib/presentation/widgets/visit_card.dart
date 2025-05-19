import 'package:flutter/material.dart';
import 'package:visit_tracker/core/constants/app_styles.dart';
import 'package:visit_tracker/domain/entities/visit.dart';

class VisitCard extends StatelessWidget {
  final Visit visit;

  const VisitCard({Key? key, required this.visit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/visit/${visit.id}'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: AppStyles.cardDecoration,
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    visit.status == 'Completed'
                        ? AppStyles.primaryColor
                        : AppStyles.accentColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                visit.status == 'Completed' ? Icons.check : Icons.pending,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Visit #${visit.id}', style: AppStyles.headerText),
                  Text(
                    'Customer: ${visit.customerId}',
                    style: AppStyles.bodyText,
                  ),
                  Text(
                    'Date: ${visit.visitDate.toIso8601String().split('T')[0]}',
                    style: AppStyles.bodyText,
                  ),
                ],
              ),
            ),
            // Status Toggle
            Icon(Icons.check_circle, color: AppStyles.primaryColor, size: 20),
          ],
        ),
      ),
    );
  }
}
