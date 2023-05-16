import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sec13/providers/user_places_provider.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  //initialise form key to use
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty) {
      return;
    }
    //entering the value in provider
    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Place"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Title",
                  ),
                  controller: _titleController,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _savePlace,
                  label: const Text("Add Place"),
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
