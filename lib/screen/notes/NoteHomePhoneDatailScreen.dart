import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

/// The details screen for either the A or B screen.
class NoteHomePhoneDetailScreen extends StatefulWidget {
  /// Constructs a [NoteDetailScreen].
  const NoteHomePhoneDetailScreen({
    required this.label,
    required this.detailsHomePhonePath,
    Key? key,
  }) : super(key: key);

  /// The label to display in the center of the screen.
  final String label;

  /// The path to the detail page
  final String detailsHomePhonePath;

  @override
  State<StatefulWidget> createState() => NoteHomePhoneDetailScreenState();
}

/// The state for DetailsScreen
class NoteHomePhoneDetailScreenState extends State<NoteHomePhoneDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Домофоны - Список домофонов'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Детальный список домофонов',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        //Beamer.of(context).beamToNamed(widget.detailsHomePhonePath),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
