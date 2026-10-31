import 'package:flutter/material.dart';
import 'package:untitled1/widgets/circle_icon.dart';
import 'package:untitled1/widgets/custom_app_bar_details.dart';
import '../models/article models.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({
    super.key,
    required this.model,
  });

  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppBarDetails(),
      

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                model.image ?? '',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),


            Row(
              spacing: 4,
              children: [
                Text(
                  model.author ?? 'Reem Hany',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,fontSize: 18
                  ),
                ),
                Spacer(),
                Icon(Icons.favorite_border_outlined),
                Text('204',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)
              ],
            ),

            const SizedBox(height: 8),

            Text(
              model.date ?? 'Date',
              style: const TextStyle(
                color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600
              ),
            ),

            const SizedBox(height: 16),


            Text(
              model.title ?? '(no titile)',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),


            Text(
              model.description ?? 'Reem Hany(no description).',
              style: const TextStyle(
                fontSize: 16,fontWeight: FontWeight.w600
              ),
            ),

            const SizedBox(height: 16),

            Text(
              model.content ?? 'Reem Hany(no content).',
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}