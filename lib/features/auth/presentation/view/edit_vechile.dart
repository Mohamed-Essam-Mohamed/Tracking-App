import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';
import 'package:tracking_app/features/auth/presentation/view_model/apply/apply_cubit.dart';
import 'package:tracking_app/features/auth/presentation/view_model/apply/apply_state.dart';
import 'package:tracking_app/features/auth/presentation/widgets/upload_image.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class EditVechileScreen extends StatefulWidget {
  const EditVechileScreen({super.key});

  @override
  State<EditVechileScreen> createState() => _EditVechileScreenState();
}

class _EditVechileScreenState extends State<EditVechileScreen> {
  final ApplyCubit apply = serviceLocator<ApplyCubit>();
  final _formKey = GlobalKey<FormState>();

  final vehicleNumberController = TextEditingController();
  final vehicleLicenseController = TextEditingController();

  File? vehicleLicense;
  String? selectedVehicleType;
  VehiclesEntity? selectedVehicle;

  bool _isVehicleInitialized = false;

  @override
  void initState() {
    super.initState();
    apply.getAllVehicles();  }

  @override
  void dispose() {
    vehicleNumberController.dispose();
    vehicleLicenseController.dispose();
    super.dispose();
  }

  Future<void> _pickVehicleLicenseImage() async {
    final image = await UploadImage.pickImage(context);
    if (image != null) {
      setState(() {
        vehicleLicense = image;
        vehicleLicenseController.text = image.path;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isVehicleInitialized && apply.vehiclesList.isNotEmpty) {
      selectedVehicle = apply.vehiclesList.first;
      selectedVehicleType = selectedVehicle?.id;
      _isVehicleInitialized = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => apply,
      child: BlocListener<ApplyCubit, ApplyState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.apply_Apply.tr()),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<ApplyCubit, ApplyState>(
              builder: (context, state) {
                if (state is VehiclesLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (apply.vehiclesList.isEmpty) {
                  return const Center(child: Text('No vehicle types available'));
                }

                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                        value: selectedVehicleType,
                        items: apply.vehiclesList.map((vehicle) {
                          return DropdownMenuItem(
                            value: vehicle.id,
                            child: Text(vehicle.type ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedVehicleType = value;
                            selectedVehicle = apply.vehiclesList.firstWhere(
                                    (v) => v.id == selectedVehicleType);
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Vehicle Type',
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) => val == null ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: vehicleNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Vehicle Number',
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) =>
                        val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: vehicleLicenseController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Vehicle License',
                          border: const OutlineInputBorder(),
                          suffixIcon: InkWell(
                            onTap: _pickVehicleLicenseImage,
                            child: const Icon(Icons.upload_file),
                          ),
                        ),
                        validator: (val) =>
                        val == null || val.isEmpty ? 'Upload required' : null,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
