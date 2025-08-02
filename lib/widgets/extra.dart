import 'package:flutter/material.dart';
import 'package:flutter_unicode_tasks/data/constants.dart';

class Extra extends StatelessWidget {
  final String language;
  final String country;
  final String awards;
  const Extra({
    super.key,
    required this.language,
    required this.country,
    required this.awards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.language, color: Color.fromRGBO(191, 203, 173, 1)),
                  SizedBox(width: 4),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Language:', style: KTextStyle.descriptiontext),
                        Text(
                          language,
                          style: KTextStyle.offtext,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 40),
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.public, color: Color.fromRGBO(191, 203, 173, 1)),
                  SizedBox(width: 4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Country:', style: KTextStyle.descriptiontext),
                        Text(
                          country,
                          style: KTextStyle.offtext,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.military_tech, color: Color.fromRGBO(191, 203, 173, 1)),
            SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Awards:', style: KTextStyle.descriptiontext),
                  Text(awards, style: KTextStyle.offtext, softWrap: true),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
