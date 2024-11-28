import 'package:flutter/material.dart';
import 'package:naklijet_demo/view/pages/my_cars_view/my_cars_widget/add_button_widget.dart';
import 'package:naklijet_demo/widget/empty_choose_widget.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MyCarsPage extends StatefulWidget {
  const MyCarsPage({super.key});

  @override
  _MyCarsPageState createState() => _MyCarsPageState();
}

class _MyCarsPageState extends State<MyCarsPage> {
  String? _selectedVehicleType;
  TextEditingController _plateController = TextEditingController();

  final List<String> _vehicleTypes = ["Araba", "Motosiklet", "Kamyon"];
  List<Map<String, String>> _addedCars = []; // Eklenen araçları tutacak liste

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_addedCars.isEmpty) // Eğer hiç araç eklenmediyse
              const EmptyChooseWidget(
                text: "Araç Ekle",
              )
            else // Araç eklenmişse, araçları göster
              Expanded(
                child: ListView.builder(
                  itemCount: _addedCars.length,
                  itemBuilder: (context, index) {
                    final car = _addedCars[index];
                    return ListTile(
                      title: Text("Araç Tipi: ${car['vehicleType']}"),
                      subtitle: Text("Plaka: ${car['plateNumber']}"),
                      leading: Icon(Icons.directions_car, size: 40),
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AddButttonWidget(
                text: "Araç Ekle",
                onPressed: () {
                  WoltModalSheet.show(
                    context: context,
                    pageListBuilder: (bottomSheetContext) => [
                      SliverWoltModalSheetPage(
                        mainContentSliversBuilder: (context) => [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Araç Tipi Seçiniz:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      labelText: "Araç Tipi",
                                      border: OutlineInputBorder(),
                                    ),
                                    items: _vehicleTypes.map((String type) {
                                      return DropdownMenuItem<String>(
                                        value: type,
                                        child: Text(type),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedVehicleType = newValue;
                                      });
                                    },
                                    value: _selectedVehicleType,
                                  ),
                                  const SizedBox(height: 16),
                                  TextField(
                                    controller: _plateController,
                                    decoration: const InputDecoration(
                                      labelText: "Plaka Numarası",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_selectedVehicleType != null &&
                                            _plateController.text.isNotEmpty) {
                                          String vehicleType =
                                              _selectedVehicleType!;
                                          String plateNumber =
                                              _plateController.text;

                                          // Araç ekle
                                          setState(() {
                                            _addedCars.add({
                                              'vehicleType': vehicleType,
                                              'plateNumber': plateNumber,
                                            });
                                          });

                                          // Kaydetme işlemi
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Araç Tipi: $vehicleType, Plaka: $plateNumber kaydedildi."),
                                            ),
                                          );

                                          // Modal'ı kapat
                                          Navigator.of(context).pop();
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "Lütfen tüm alanları doldurunuz."),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text("Tamam"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
