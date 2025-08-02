import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_unicode_tasks/data/constants.dart';

class Credits extends StatelessWidget {
  final String director;
  final String writer;
  final String? actors;

  const Credits({
    super.key,
    required this.director,
    required this.writer,
    this.actors, // Optional
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Director Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/pers.svg', height: 20, width: 20),
            SizedBox(width: 6),
            Text('Director: ', style: KTextStyle.offtext),
            Expanded(child: Text(director, softWrap: true)),
          ],
        ),
        SizedBox(height: 8),

        // Writers Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/scr.svg', height: 20, width: 20),
            SizedBox(width: 6),
            Text('Writers: ', style: KTextStyle.offtext),
            Expanded(child: Text(writer, softWrap: true)),
          ],
        ),
        SizedBox(height: 8),

        // Actors Row — only if available
        if (actors != null && actors!.trim().isNotEmpty)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.person, size: 20, color: Colors.grey[400]),
              SizedBox(width: 6),
              Text('Actors: ', style: KTextStyle.offtext),
              Expanded(child: Text(actors!, softWrap: true)),
            ],
          ),
      ],
    );
  }
}
