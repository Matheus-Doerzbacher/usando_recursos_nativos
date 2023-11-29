import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usando_recursos_nativos/providers/great_places.dart';
import 'package:usando_recursos_nativos/widgets/image_input.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      title: _titleController.text,
      image: _pickedImage!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Lugar"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: "Título",
                        ),
                      ),
                      const SizedBox(height: 10),
                      ImageInput(_selectImage),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.add, size: 30),
                label: const Text(
                  "Adicionar",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
