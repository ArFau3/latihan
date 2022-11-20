import 'package:flutter/material.dart';
import '../data/Kontak.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListScreen extends StatelessWidget {
  
  _lihatKontak() async {
    WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  var database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'kontak_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE kontak(index INTEGER PRIMARY KEY AUTO_INCREMENT, nama TEXT, no_hp TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  Future<List<Kontak>> kontak() async {
    
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('kontak');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Kontak(
        nama: maps[i]['nama'],
        no_hp: maps[i]['no_hp'],
      );
    });
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
      ),
      body: ListView.builder(

        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('${_lihatKontak()['nama']}'),
              subtitle: Text('${_lihatKontak()['no_hp']}'),
            ),
          );
        },
      ),
    );
  }
}