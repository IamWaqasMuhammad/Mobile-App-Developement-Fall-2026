import 'package:flutter/material.dart';
import '../services/secure_storage_services.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _textController = TextEditingController();

  final SecureStorageServices _storage = SecureStorageServices();

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  Future<void> _loadNote() async {
    String note = await _storage.readNotes();

    if (!mounted) return;

    setState(() {
      _textController.text = note;
    });
  }

  Future<void> _saveNote() async {
    await _storage.saveNotes(_textController.text);

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Note saved successfully!')));
  }

  Future<void> _clearNote() async {
    await _storage.deleteNotes();

    if (!mounted) return;

    setState(() {
      _textController.clear();
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Note cleared successfully!')));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Store your Notes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange.shade200,
        elevation: 2,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 75,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade50,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 8),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'My Private Notes',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        'Store your private notes and sensitive data',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _textController,
                maxLines: 5,
                autocorrect: true,
                cursorColor: Colors.deepOrange,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,

                decoration: InputDecoration(
                  hintText: 'Write your private note...',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                      width: 2,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _saveNote,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Save Note'),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: _clearNote,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.deepOrange,
                          side: const BorderSide(color: Colors.deepOrange),
                        ),
                        child: const Text('Delete Note'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
