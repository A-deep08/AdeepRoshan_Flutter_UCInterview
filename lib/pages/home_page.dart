import 'package:flutter/material.dart';
import 'package:flutter_unicode_tasks/data/constants.dart';
import 'package:flutter_unicode_tasks/pages/shuffle_page.dart';
import 'package:flutter_unicode_tasks/widgets/credits.dart';
import 'package:flutter_unicode_tasks/widgets/description.dart';
import 'package:flutter_unicode_tasks/widgets/extra.dart';
import 'package:flutter_unicode_tasks/widgets/rating_genre.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: 390,
                  height: 761,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(30, 32, 26, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('The Dark Knight', style: KTextStyle.titletext),
                        SizedBox(height: 16),
                        Image(
                          image: AssetImage('assets/images/dark_knight.png'),
                        ),
                        SizedBox(height: 3.9),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 16, // horizontal gap between items
                          children: [
                            Text('2008', style: KTextStyle.descriptiontext),
                            Text('152 min', style: KTextStyle.descriptiontext),
                            Text('PG-13', style: KTextStyle.descriptiontext),
                          ],
                        ),
                        SizedBox(height: 7),
                        RatingGenre(
                          genre:
                              'Action'
                              'Crime',
                          rating: '9.0',
                          votes: '2.5M',
                        ),
                        SizedBox(height: 7),
                        Credits(
                          director: 'Christopher Nolan',
                          writer: 'Jonathan Nolan, Christopher Nolan',
                        ),
                        Description(
                          plot:
                              'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
                        ),
                        SizedBox(height: 7),
                        Extra(
                          language: 'English',
                          country: 'United States',
                          awards: 'Won 2 oscars',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB1D18A),
                  fixedSize: const Size(390, 48),
                  foregroundColor: Color.fromARGB(255, 26, 39, 12),
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ShufflePage();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Shuffle',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
