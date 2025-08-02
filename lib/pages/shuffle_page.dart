import 'package:flutter/material.dart';
import 'package:flutter_unicode_tasks/fetch_movie.dart';
import 'package:flutter_unicode_tasks/data/constants.dart';
import 'package:flutter_unicode_tasks/data/movie.dart';
import 'package:flutter_unicode_tasks/widgets/credits.dart';
import 'package:flutter_unicode_tasks/widgets/description.dart';
import 'package:flutter_unicode_tasks/widgets/extra.dart';
import 'package:flutter_unicode_tasks/widgets/rating_genre.dart';

class ShufflePage extends StatefulWidget {
  const ShufflePage({super.key});

  @override
  State<ShufflePage> createState() => ShufflePageState();
}

class ShufflePageState extends State<ShufflePage> {
  late Future<Movie> futureMovie;

  @override
  void initState() {
    super.initState();
    futureMovie = fetchRandomMovie();
  }

  void shuffleMovie() {
    setState(() {
      futureMovie = fetchRandomMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: FutureBuilder<Movie>(
            future: futureMovie,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No data found.'));
              }

              final movie = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 390,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(30, 32, 26, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movie.title, style: KTextStyle.titletext),
                              const SizedBox(height: 16),
                              Image.network(
                                movie.poster,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image),
                              ),
                              const SizedBox(height: 3.9),
                              Wrap(
                                spacing: 16,
                                children: [
                                  Text(
                                    movie.year,
                                    style: KTextStyle.descriptiontext,
                                  ),
                                  Text(
                                    movie.runtime,
                                    style: KTextStyle.descriptiontext,
                                  ),
                                  Text(
                                    movie.rated,
                                    style: KTextStyle.descriptiontext,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              RatingGenre(
                                genre: movie.genre,
                                rating: movie.imdbRating.toString(),
                                votes: movie.imdbVotes,
                              ),
                              const SizedBox(height: 7),
                              Credits(
                                director: movie.director,
                                writer: movie.writer,
                                actors: movie.actors,
                              ),
                              Description(plot: movie.plot),
                              const SizedBox(height: 7),
                              Extra(
                                language: movie.language,
                                country: movie.country,
                                awards: movie.awards,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB1D18A),
                      fixedSize: const Size(390, 48),
                      foregroundColor: const Color.fromARGB(255, 26, 39, 12),
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: shuffleMovie,
                    child: const Text(
                      'Shuffle',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
