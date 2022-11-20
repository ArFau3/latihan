import 'package:flutter/material.dart';
import '../data/Kontak.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TambahScreen extends StatelessWidget {
  TambahScreen({super.key});

  TextEditingController _nama = new TextEditingController();

  TextEditingController _no_hp = new TextEditingController();

  _ubahData() async {
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
        Future<void> insertKontak(Kontak kontak) async {
          // Get a reference to the database.
          var db = await database;

          // Insert the Dog into the correct table. You might also specify the
          // `conflictAlgorithm` to use in case the same dog is inserted twice.
          //
          // In this case, replace any previous data.
          await db.insert(
            'kontak',
            kontak.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }




      var data = Kontak(nama: _nama.text, no_hp: _no_hp.text);
     insertKontak(data);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children:[ Center(
          child: Column(
            children: [
              /* Margin atas */
              SizedBox(
                height: media.height * 0.3,
              ),
              /* Form Login */
                /* Nama */
              Container(
                width: media.width * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(
                  'Nama',
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: media.width * 0.9,
                child: TextField(
                  controller: _nama,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
                /* END Nama */
                /* No. Hp */
              Container(
                width: media.width * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(
                  'No HP',
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: media.width * 0.9,
                child: TextField(
                  controller: _no_hp,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
                /* END No. Hp */
               SizedBox(
                height: media.height * 0.05,
              ),
                /* Tombol Simpan */
              SizedBox(
                width: media.width * 0.75,
                height: media.height * 0.07,
                child: ElevatedButton(
                  onPressed: () { 
                      _ubahData();
                      Navigator.pushNamed(context, '/list');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 97, 198, 255),
                  ),
                  child: const Text(
                    'SIMPAN',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ),
              ),
                /* END Tombol Simpan */
              /* END Form Login */
            ],
          ),
        ),]
      ),
    );
  }
}