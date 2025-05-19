import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visit_tracker/core/constants/app_styles.dart';
import 'package:visit_tracker/domain/entities/visit.dart';
import 'package:visit_tracker/presentation/providers/visit_provider.dart';

class AddVisitPage extends StatefulWidget {
  const AddVisitPage({Key? key}) : super(key: key);

  @override
  _AddVisitPageState createState() => _AddVisitPageState();
}

class _AddVisitPageState extends State<AddVisitPage> {
  final _formKey = GlobalKey<FormState>();
  int? customerId;
  String? location;
  String? notes;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VisitProvider>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Add Visit', style: AppStyles.headerText),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                color: AppStyles.cardBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.person, color: AppStyles.primaryColor),
                  title: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Customer ID',
                      border: InputBorder.none,
                    ),
                    style: AppStyles.bodyText,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => customerId = int.tryParse(value),
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                color: AppStyles.cardBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: AppStyles.primaryColor,
                  ),
                  title: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Location',
                      border: InputBorder.none,
                    ),
                    style: AppStyles.bodyText,
                    onChanged: (value) => location = value,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                color: AppStyles.cardBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.notes, color: AppStyles.primaryColor),
                  title: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Notes',
                      border: InputBorder.none,
                    ),
                    style: AppStyles.bodyText,
                    maxLines: 3,
                    onChanged: (value) => notes = value,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final visit = Visit(
                      id: 0,
                      customerId: customerId!,
                      visitDate: DateTime.now(),
                      status: 'Pending',
                      location: location!,
                      notes: notes ?? '',
                      activitiesDone: [],
                      createdAt: DateTime.now(),
                    );
                    provider.addNewVisit(visit).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyles.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
