import 'package:err_rss_reader/presentation/style/app_colors.dart';
import 'package:err_rss_reader/presentation/style/app_text_style.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.image,
    required this.title,
    required this.pubDate,
    required this.onTap,
  });

  final String image;
  final String title;
  final String pubDate;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: getHeaderStyle(
                fontSize: 18,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              pubDate,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: getBodyStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
