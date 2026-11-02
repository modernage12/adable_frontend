import 'package:flutter/material.dart';
import 'package:adable_mvp/theme/app_spacing.dart';

class CampagnaCard extends StatelessWidget {
  const new({
    super.key,
    required this.nome,
    required this.piattaforma,
    required this.budget,
  });

  final String nome;
  final String piattaforma;
  final String budget;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.large),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(nome, style: Theme.of(context).textTheme.titleMedium),
                  Icon(Icons.chevron_right),
                ],
              ),
              SizedBox(height: AppSpacing.small),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    piattaforma,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "€$budget",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
