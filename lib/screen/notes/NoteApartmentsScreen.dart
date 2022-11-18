import 'dart:async';

import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:rent_application/helpers/repository/firestore_service.dart';
import 'package:rent_application/models/ApartmentModel.dart';
import 'package:rent_application/models/HomePhoneModel.dart';
import 'package:rent_application/screen/notes/AddHomePhoneForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// The details screen for either the A or B screen.
class NoteApartmentsScreen extends StatefulWidget {
  /// Constructs a [NoteDetailScreen].
  const NoteApartmentsScreen({
    required this.label,
    required this.detailsApartmentPath,
    Key? key,
  }) : super(key: key);

  /// The label to display in the center of the screen.
  final String label;

  /// The path to the detail page
  final String detailsApartmentPath;

  @override
  State<StatefulWidget> createState() => NoteApartmentsScreenState();
}

//функция преобразования списка снапшотов коллекции в список сообщений
StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<ApartmentModel>>
    documentToApartmentsTransformer = StreamTransformer<
            QuerySnapshot<Map<String, dynamic>>,
            List<ApartmentModel>>.fromHandlers(
        handleData: (QuerySnapshot<Map<String, dynamic>> snapShot,
            EventSink<List<ApartmentModel>> sink) {
  List<ApartmentModel> result = [];
  snapShot.docs.forEach((element) {
    FirestoreService.getApartments(element.id).then((value) {
      if (value != null) {
        result.add(ApartmentModel(
          address: value['address'],
          number: value['number'],
          mainPhoto: value['mainPhoto'],
          validPhoto: value['validPhoto'],
        ));
        sink.add(result = List.from(result.reversed));
        print('Результат $result');
      }
    });
  });
  sink.add(result = List.from(result.reversed));
});

/// The state for DetailsScreen
class NoteApartmentsScreenState extends State<NoteApartmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Квартиры - Список квартир'),
      ),
      body: _emptyMessage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showDialog(
                context: context, builder: (context) => AddHomePhoneForm());
          });
        },
        //Beamer.of(context).beamToNamed(widget.detailsHomePhonePath),
        tooltip: 'Добавить',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _emptyMessage() {
  return Center(
    child: Container(
      child: Text(
        'Квартир нет',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0),
      ),
    ),
  );
}
