import 'package:adable_mvp/widgets/card_campagna.dart';
import 'package:flutter/material.dart';
import 'package:adable_mvp/theme/app_spacing.dart';
import 'package:adable_mvp/widgets/stat_card.dart';
import 'package:adable_mvp/services/campagne_api.dart';
import 'package:adable_mvp/pages/nuova_campagna_page.dart';
import 'package:adable_mvp/pages/dettaglio_campagne.dart';

class CampagnePage extends StatefulWidget {
  const new({super.key});

  @override
  State<CampagnePage> createState() => _CampagnePageState();
}

class _CampagnePageState extends State<CampagnePage> {
  Future<List<dynamic>> campagneFuture = recuperaCampagne();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adable")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Le tue campagne",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(height: AppSpacing.medium),

              Text(
                "Gestisci e monitora le tue campagne pubblicitarie.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              SizedBox(height: AppSpacing.medium),

              FutureBuilder(
                future: campagneFuture,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Caricamento...");
                  }

                  if (snapshot.hasError) {
                    return Text("Errore nel caricamento.");
                  }

                  final campagne = snapshot.data ?? [];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatCard(
                        titolo: "Campagne totali",
                        valore: campagne.length.toString(),
                      ),
                      SizedBox(height: AppSpacing.small),
                      for (final campagna in campagne)
                        InkWell(
                          onTap: () async {
                            final risultato = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DettaglioCampagne(campagna: campagna),
                              ),
                            );

                            if (!mounted) return;

                            if (risultato == true) {
                              setState(() {
                                campagneFuture = recuperaCampagne();
                              });
                            }
                          },
                          child: CampagnaCard(
                            nome: campagna['nome'],
                            piattaforma: campagna['piattaforma'],
                            budget: campagna['budget'],
                          ),
                        ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Nuova Campagna"),
        onPressed: () async {
          final risultato = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NuovaCampagnaPage()),
          );

          if (!mounted) return;

          if (risultato == true) {
            setState(() {
              campagneFuture = recuperaCampagne();
            });
          }
        },
      ),
    );
  }
}
