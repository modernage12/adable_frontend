import 'package:flutter/material.dart';
import 'package:adable_mvp/theme/app_spacing.dart';
import 'package:adable_mvp/services/campagne_api.dart';

class DettaglioCampagne extends StatelessWidget {
  const new({super.key, required this.campagna});

  final Map<String, dynamic> campagna; // Passo il dizionario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dettaglio campagna")),
      body: Card(
        color: Colors.white,
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.large),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NOME CAMPAGNA",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: AppSpacing.small),
                Text(
                  campagna['nome'],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: AppSpacing.large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Piattaforma",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      campagna['piattaforma'],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.small),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Budget",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "€${campagna['budget']}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () async {
                        final conferma = await showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                            title: Text("Eliminare la campagna?"),
                            content: Text("Questa operazione è irreversibile"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text("Annulla"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text("Elimina"),
                              ),
                            ],
                          )),
                        );

                        if (!context.mounted || conferma != true) return;

                        try {
                          await eliminaCampagna(id: campagna['id']);

                          if (!context.mounted) return;

                          Navigator.pop(context, true);
                        } catch (errore) {
                          if (!context.mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Errore: $errore")),
                          );
                        }
                      },

                      label: Text("Elimina campagna"),
                      icon: Icon(Icons.delete_outline, color: Colors.red),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
