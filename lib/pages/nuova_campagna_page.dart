import 'package:flutter/material.dart';
import 'package:adable_mvp/theme/app_spacing.dart';
import 'package:adable_mvp/services/campagne_api.dart';

class NuovaCampagnaPage extends StatefulWidget {
  const new({super.key});

  @override
  State<NuovaCampagnaPage> createState() => _NuovaCampagnaPageState();
}

class _NuovaCampagnaPageState extends State<NuovaCampagnaPage> {
  String nome = '';
  String piattaforma = '';
  String budget = '';
  String clienteId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nuova Campagna")),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Crea una nuova campagna",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              Text(
                "Inserisci i dettagli della nuova campagna.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              SizedBox(height: AppSpacing.large),

              TextField(
                decoration: InputDecoration(
                  labelText: "Nome campagna",
                  hintText: "Es. Black Friday",
                  border: OutlineInputBorder(),
                ),
                onChanged: (valore) {
                  nome = valore;
                },
              ),

              SizedBox(height: AppSpacing.medium),

              TextField(
                decoration: InputDecoration(
                  labelText: "Piattaforma",
                  hintText: "Es. Google Ads",
                  border: OutlineInputBorder(),
                ),
                onChanged: (valore) {
                  piattaforma = valore;
                },
              ),

              SizedBox(height: AppSpacing.medium),

              TextField(
                decoration: InputDecoration(
                  labelText: "Budget",
                  hintText: "Es. 1500",
                  border: OutlineInputBorder(),
                ),
                onChanged: (valore) {
                  budget = valore;
                },
              ),

              SizedBox(height: AppSpacing.medium),

              TextField(
                decoration: InputDecoration(
                  labelText: "ID Cliente",
                  hintText: "Es. 1",
                  border: OutlineInputBorder(),
                ),
                onChanged: (valore) {
                  clienteId = valore;
                },
              ),

              SizedBox(height: AppSpacing.large),

              ElevatedButton(
                onPressed: () async {
                  // funzione POST
                  final id = int.tryParse(clienteId);

                  if (id == null) {
                    return;
                  }

                  try {
                    await creaCampagna(
                      nome: nome,
                      piattaforma: piattaforma,
                      budget: budget,
                      clienteId: id,
                    );

                    if (!context.mounted) return;

                    Navigator.pop(context, true);
                  } catch (errore) {
                    if (!context.mounted) return;

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Errore: $errore")));
                  }
                },
                child: Text("Salva campagna"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
