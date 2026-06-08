import 'package:ciilaabokk_ouvrier_user/app/data/models/ouvrier.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/login/login_screen.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/ouvrier/ouvrierController.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/ouvriers/ouvriersController.dart';
import 'package:ciilaabokk_ouvrier_user/app/utils/messages.dart';
import 'package:ciilaabokk_ouvrier_user/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/web.dart';

// ...existing code...
final logger = Logger();

class Ouvrierscreen extends StatelessWidget {
  // const OuvriersScreen({super.key});

  final OuvrierController controller = Get.find<OuvrierController>();
  // final Ouvrier ouvrier = Get.arguments as Ouvrier;
  @override
  Widget build(BuildContext context) {
    print("arguments: ${controller.ouvrier.toString()}");
    //final VentesController controller = Get.put(VentesController());

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 173, 253),
              ),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Home page"),
              onTap: () {
                Get.offAll(HomePage());
              },
            ),
            ListTile(
              title: Text("Ventes"),
              onTap: () {
                // Get.offAll(VentesScreen());
              },
            ),
            ListTile(
              title: Text("Dépenses"),
              onTap: () {
                // Get.offAll(DepensesScreen());
              },
            ),
            ListTile(
              title: Text("Produits"),
              onTap: () {
                // Get.offAll(ProduitsScreen());
              },
            ),
            ListTile(
              title: Text("Journal"),
              onTap: () {
                // Get.offAll(JournalScreen());
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: Text(
          "Les informations de l'ouvrier",
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'avenir',
            fontWeight: FontWeight.w900,
            color: Color.fromARGB(255, 0, 173, 253),
          ),
        ),

        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Déconnexion"),
                    content: Text(
                      "Êtes-vous sûr de vouloir vous déconnecter ?",
                    ),
                    actions: [
                      TextButton(
                        child: Text("Annuler"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("Se déconnecter"),
                        onPressed: () async {
                          Navigator.of(context).pop(); // Close the dialog
                          await controller.authControler.logout();
                          Get.to(() => LoginScreen());
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFF5F5F5),

      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(4),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [Text("${controller.authProvider.user.user?.name}")],
              ),
            ),
          ),
          SizedBox(height: 2),

          Obx(() {
            if (controller.ouvrier.isEmpty) {
              return SizedBox.shrink();
            }
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(
                  "Liste des ouvriers",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: 'Vente total: ${controller.ouvrier}'),
                      TextSpan(text: 'Réparation: ${controller.ouvrier}'),
                      TextSpan(text: 'Dépense total:${controller.ouvrier}'),
                    ],
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 2),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              // Default widget if none of the above conditions are met
              return ListView.builder(
                itemCount: controller.ouvrier.length,
                itemBuilder: (context, index) {
                  final ouvriers = controller.ouvrier[index];
                  return Column(
                    children: ouvriers.ouvriers.map((o) {
                      return Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          onTap: () => {Get.to(HomePage())},
                          title: Text(
                            o.name!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text.rich(
                            TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: 'Metier: ${o.metier?.name}\n'),
                                TextSpan(text: 'Domaine: ${o.domaine?.name}\n'),
                                TextSpan(
                                  text: 'Departement: ${o.departement?.name}\n',
                                ),
                                TextSpan(
                                  text: '\Region:${o.region?.name}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 0, 173, 253),
                            child: Text(
                              o.name![0],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // IconButton(
                              //   icon: Icon(
                              //     Icons.remove_red_eye_outlined,
                              //     color: Color.fromARGB(255, 4, 38, 255),
                              //   ),
                              //   onPressed: () async {
                              //     try {
                              //       // if (v.produit == null) {
                              //       //   produitFromVenteList = null;
                              //       // } else {
                              //       //   produitFromVenteList =
                              //       //       await produitController.getProduit(
                              //       //         v.produit.id,
                              //       //       );
                              //       //   logger.w(
                              //       //     "Produit: ${produitFromVenteList == null}",
                              //       //   );

                              //       logger.i(
                              //         "ok pour voir les infos de l'ouvriers",
                              //       );
                              //       // Get.to(
                              //       //   () => VenteScreen(),
                              //       //   arguments: {
                              //       //     "vente": v,
                              //       //     "produit": produitFromVenteList,
                              //       //   },
                              //       // );
                              //     } catch (e) {
                              //       throw errorMessage("${e.toString()}");
                              //     } finally {
                              //       controller.isLoading(false);
                              //     }
                              //     // verifier si le produit de la vente existe dans produitList;
                              //   },
                              // ),
                              // IconButton(
                              //   icon: Icon(Icons.delete, color: Colors.red),
                              //   onPressed: () {
                              //     logger.i("ok pour la suppression ");
                              //     // controller.deleteVente(v.id!);
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
// ...existing code...