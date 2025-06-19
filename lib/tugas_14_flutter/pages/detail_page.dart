import 'package:flutter/material.dart';
import 'package:ppkd_b_2/tugas_14_flutter/const/app_color.dart';
import 'package:ppkd_b_2/tugas_14_flutter/models/data_model.dart';

class DetailPage extends StatelessWidget {
  final Result character;

  const DetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'Details',
          style: TextStyle(color: AppColor.textColor),
        ),
        iconTheme: IconThemeData(color: AppColor.textColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Hero(
              tag: 'character-${character.id}',
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(character.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTile(
                    'Name',
                    character.name,
                    const Icon(Icons.person, color: Colors.white),
                  ),
                  _buildTile(
                    'Status',
                    character.status.toString().split('.').last,
                    const Icon(Icons.favorite, color: Colors.white),
                  ),
                  _buildTile(
                    'Species',
                    character.species.toString().split('.').last,
                    const Icon(Icons.pets, color: Colors.white),
                  ),
                  _buildTile(
                    'Type',
                    character.type.isEmpty ? 'Unknown' : character.type,
                    const Icon(Icons.category, color: Colors.white),
                  ),
                  _buildTile(
                    'Gender',
                    character.gender.toString().split('.').last,
                    const Icon(Icons.wc, color: Colors.white),
                  ),
                  _buildTile(
                    'Location',
                    character.location.name,
                    const Icon(Icons.location_on, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(String title, String value, Icon icon) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          color: AppColor.textColor.withOpacity(0.7),
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        value,
        style: TextStyle(
          color: AppColor.textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
