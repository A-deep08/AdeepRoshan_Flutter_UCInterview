import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_unicode_tasks/data/constants.dart';

class RatingGenre extends StatelessWidget {
  final String genre;
  final String rating;
  final String votes;

  const RatingGenre({
    super.key,
    required this.genre,
    required this.rating,
    required this.votes,
  });

  @override
  Widget build(BuildContext context) {
    final genreList = genre.split(',').map((e) => e.trim()).toList();

    return Wrap(
      direction: Axis.vertical,
      spacing: 8,
      children: [
        Wrap(
          spacing: 8,
          children: genreList.map((g) {
            return Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(53, 78, 22, 1),
                borderRadius: BorderRadius.circular(99),
              ),
              alignment: Alignment.center,
              child: Text(
                g,
                style: KTextStyle.descriptiontext.copyWith(
                  fontSize: 13,
                  height: 1,
                ),
              ),
            );
          }).toList(),
        ),

        Wrap(
          direction: Axis.horizontal,
          spacing: 7,
          children: [
            SvgPicture.asset('assets/icons/star.svg', height: 22, width: 22),
            Text(
              '$rating/10',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 1,
              ),
            ),
            Text(
              '($votes votes)',
              style: KTextStyle.offtext.copyWith(fontSize: 14, height: 1),
            ),
          ],
        ),
      ],
    );
  }
}
