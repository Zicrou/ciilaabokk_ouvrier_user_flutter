import 'package:ciilaabokk_ouvrier_user/app/data/models/ouvrier.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/login/login_screen.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/ouvrier/image_preview_screen.dart';
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
  final OuvrierController controller = Get.put(OuvrierController());
  @override
  Widget build(BuildContext context) {
    print("OuvrierfromParams: ${Get.arguments}");
    final ouvrier = Get.arguments['ouvrier'] as Ouvrier;
    controller.ouvrier.assign(ouvrier);

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
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.ouvrier.isEmpty) {
                return Center(child: const Text("Pas d'ouvrier"));
              }
              // Default widget if none of the above conditions are met
              return ListView.builder(
                itemCount: controller.ouvrier.length,
                itemBuilder: (context, index) {
                  final ouvrier = controller.ouvrier[index];
                  return Column(
                    children: {
                      Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 1,
                        ),
                        child: ListTile(
                          title: Text(
                            "${ouvrier.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          subtitle: Text.rich(
                            TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Metier: ${ouvrier.metier?.name}\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Domaine: ${ouvrier.domaine?.name}\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Téléphone: ${ouvrier.phoneNumber}\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Departement: ${ouvrier.departement?.name}\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Region: ${ouvrier.region?.name}\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Adresse:${ouvrier.adress}\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Entreprises: ${ouvrier.entreprises}\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),

                                TextSpan(
                                  text: 'Email: ${ouvrier.email}\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Téléphone_2: ${ouvrier.phoneNumber2}\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '\nAnnées expériences:${ouvrier.anneeExperience} ans',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 0, 173, 253),
                            child: Text(
                              "${ouvrier.name?[0]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    }.toList(),
                  );
                },
              );
            }),
          ),
          Expanded(
            child: Obx(() {
              // padding:
              // EdgeInsets.symmetric(vertical: -10);
              // print("Portfolio  lengh : ${ouvrier.portfolios.length}");
              if (ouvrier.portfolios!.isEmpty) {
                return const Center(
                  child: Text("Aucun élément dans le portfolio"),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const Text(
                    "Portfolio",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      itemCount: ouvrier.portfolios?.length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,

                            crossAxisSpacing: 10,

                            mainAxisSpacing: 10,
                          ),

                      itemBuilder: (context, index) {
                        var portfolios = ouvrier.portfolios;
                        var imageUrl =
                            "http://10.0.2.2:8000/storage/${portfolios?[index].image}";
                        return GestureDetector(
                          onTap: () {
                            Get.to(ImagePreviewScreen(imageUrl: imageUrl));
                          },
                          child: Hero(
                            tag: imageUrl,

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),

                              child: Image.network(imageUrl, fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
// ...existing code...