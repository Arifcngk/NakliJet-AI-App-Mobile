import 'package:flutter/material.dart';
import 'package:naklijet_demo/providers/vehicle_provider.dart';
import 'package:naklijet_demo/view/pages/my_cars_view/my_cars_widget/add_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class MyCarsPage extends StatelessWidget {
  const MyCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<VehicleProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (carProvider.vecihle.isEmpty)
              _isEmptyVecihle()
            else
              Expanded(
                child: ListView.builder(
                  itemCount: carProvider.vecihle.length,
                  itemBuilder: (context, index) {
                    final car = carProvider.vecihle[index];
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          "Araç Tipi: ${car.vehicleTypes}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Plaka: ${car.plateNumber}"),
                        leading: const Icon(UniconsLine.car, size: 30),
                        trailing: IconButton(
                            onPressed: () {
                              carProvider.removeVehicle(car.plateNumber);
                            },
                            icon: const Icon(
                              UniconsLine.trash,
                              color: Colors.red,
                              size: 26,
                            )),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddButttonWidget(
                text: "Araç Ekle",
                onPressed: () {
                  // Add button action
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => AddCarForm(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _isEmptyVecihle() {
    return Column(
      children: [
        Image.asset("assets/image/choose.png"),
        const Text(
          "Aracınız Bulunmamaktadır",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class AddCarForm extends StatefulWidget {
  @override
  _AddCarFormState createState() => _AddCarFormState();
}

class _AddCarFormState extends State<AddCarForm> {
  final _plateController = TextEditingController();
  final List<String> _vehicleTypes = ["Tır", "Kamyonet", "Kamyon"];
  String? _selectedVehicleType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Araç Tipi Seçiniz:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  Provider.of<VehicleProvider>(context, listen: false)
                      .addVehicle(
                    _selectedVehicleType!,
                    _plateController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Araç Tipi: ${_selectedVehicleType!}, Plaka: ${_plateController.text} eklendi."),
                    ),
                  );

                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Lütfen tüm alanları doldurun.")),
                  );
                }
              },
              child: const Text("Tamam"),
            ),
          ),
        ],
      ),
    );
  }
}
