import 'package:ciilaabokk_ouvrier_user/app/data/models/region.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/login/login_screen.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/ouvrier/ouvrierScreen.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/ouvriers/ouvriersController.dart';
import 'package:ciilaabokk_ouvrier_user/app/utils/messages.dart';
import 'package:ciilaabokk_ouvrier_user/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/web.dart';

// ...existing code...
final logger = Logger();

class OuvriersScreen extends StatelessWidget {
  // const OuvriersScreen({super.key});

  final OuvriersController controller = Get.find<OuvriersController>();

  @override
  Widget build(BuildContext context) {
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
          "Liste des ouvriers",
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
            if (controller.ouvrierList.isEmpty) {
              return SizedBox.shrink();
            }
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Form(
                  // key: controller.rechercheKeyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Recherche",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 173, 253),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      Obx(
                        () => DropdownButtonFormField<Region>(
                          value: controller.selectedRegion.value,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.category,
                              color: Color.fromARGB(255, 0, 173, 253),
                            ),
                            labelText: "Sélectionner une Région",
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 173, 253),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          items: controller.regionlist.isNotEmpty
                              ? controller.regionlist.map((region)
                                // produitList.isNotEmpty
                                // ? produitList.map((produit)
                                {
                                  return DropdownMenuItem<Region>(
                                    value: region,
                                    child: Text(
                                      region!.name!,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 173, 253),
                                      ),
                                    ),
                                  );
                                }).toList()
                              : [],

                          onChanged: (value) {
                            controller.selectedRegion.value = value!;
                            print(
                              "Selected Region Screen: ${controller.selectedRegion.value!.id}",
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Svp veuillez remplir le champs";
                          }
                          return null;
                        },
                        controller: controller.telephone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 0, 173, 253),
                          ),
                          labelText: "Mot de passe",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 173, 253),
                          ),
                          // errorText: controller.is.value
                          //     ? null
                          //     : "Mot de passe invalide",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      Obx(
                        () => controller.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 0, 173, 253),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () => {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    0,
                                    173,
                                    253,
                                  ),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Se connecter",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () => {},
                        child: Text(
                          "Créer un compte",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 173, 253),
                            fontSize: 16,
                          ),
                        ),
                      ),
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
                itemCount: controller.ouvrierList.length,
                itemBuilder: (context, index) {
                  final ouvriers = controller.ouvrierList[index];
                  return Column(
                    children: ouvriers.ouvriers.map((o) {
                      return Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          onTap: () => {Get.to(Ouvrierscreen(), arguments: o)},
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