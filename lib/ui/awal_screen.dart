import 'package:flutter/material.dart';

class AwalScreen extends StatelessWidget{
  const AwalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            /* Margin atas */
            SizedBox(
              height: media.height * 0.2,
            ),
            /* Tambah */
            Flexible(
              child: SizedBox(
                width: media.width * 0.75,
                height: media.height * 0.07,
                child: ElevatedButton(
                  onPressed: () { 
                    Navigator.pushNamed(context, '/tambah');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 97, 198, 255),
                  ),
                  child: const Text(
                    'Tambah Kontak',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    )
                ),
              ),
            ),
            /* END Tambah */
            SizedBox(
              height: media.height * 0.05,
            ),
            /* Lihat Daftar */
            Flexible(
              child: SizedBox(
                width: media.width * 0.75,
                height: media.height * 0.07,
                child: ElevatedButton(
                  onPressed: () { 
                    Navigator.pushNamed(context, '/list');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 97, 198, 255),
                  ),
                  child: const Text(
                    'Lihat Kontak',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ),
              ),
            ),
            /* END Lihat Daftar */
          ],
        ),
      ),
    );
  }
}