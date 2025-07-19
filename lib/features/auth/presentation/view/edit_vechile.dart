import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:tracking_app/core/extentions/media_query_extensions.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/features/auth/data/models/edit_vechile_model.dart';
import 'package:tracking_app/features/auth/data/models/request/edit_profile_request.dart';
import 'package:tracking_app/features/auth/domain/entities/edit_vechile_entite.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';
import 'package:tracking_app/features/auth/presentation/view_model/apply/apply_cubit.dart';
import 'package:tracking_app/features/auth/presentation/view_model/apply/apply_state.dart';
import 'package:tracking_app/features/auth/presentation/view_model/cubit/edit_vechile_cubit.dart';
import 'package:tracking_app/features/auth/presentation/widgets/upload_image.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class EditVechileScreen extends StatefulWidget {
  const EditVechileScreen({super.key, required this.userData});
  final EditVechileModel userData;


  @override
  State<EditVechileScreen> createState() => _EditVechileScreenState();
}

class _EditVechileScreenState extends State<EditVechileScreen> {
  final ApplyCubit apply = serviceLocator<ApplyCubit>();
  final VehicleCubit cubit = serviceLocator<VehicleCubit>();

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
            title: Text("Edit Profile"),
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
                        decoration:  InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,

                          hintText: widget.userData.vehicleType,
                          label: Text("vehicle type"),
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) => val == null ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(

                        controller: vehicleNumberController,

                        decoration:  InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,

                            label: Text("vehicle number"),

                          hintText: widget.userData.vehicleNumber ,
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
                          floatingLabelBehavior: FloatingLabelBehavior.always
                          ,
                          label: Text("vehicle License"),

                          hintText:  widget.userData.vehicleLicense,
                          border: const OutlineInputBorder(),
                          suffixIcon: InkWell(
                            onTap: _pickVehicleLicenseImage,
                            child: const Icon(Icons.upload_file),
                          ),
                        ),
                        validator: (val) =>
                        val == null || val.isEmpty ? 'Upload required' : null,
                      ),
                      SizedBox(height: context.hp(40),),

                      InkWell(
                        onTap: () {

                          if (_formKey.currentState!.validate()) {
                            final formData = FormData.fromMap({
                              "vehicleType": selectedVehicleType ?? widget.userData.vehicleType,
                              "vehicleNumber": vehicleNumberController.text.isNotEmpty
                                  ? vehicleNumberController.text
                                  : widget.userData.vehicleNumber,
                              "vehicleLicense": vehicleLicenseController.text.isNotEmpty
                                  ? vehicleLicenseController.text
                                  : widget.userData.vehicleLicense,
                            });

                            // أرسلها مع ID أو رقم المركبة
                            cubit.apply(formData, widget.userData.vehicleNumber.toString()); // أو vehicleNumber حسب الـ API
                          }
                        },
                        child: Container(
                          width: context.wp(90),
                          height: context.hp(7),
                          decoration: BoxDecoration(
                            color: AppColors.pink,
                            borderRadius: BorderRadius.circular(context.sp(40)),
                          ),
                          child: Center(
                            child: Text(
                              LocaleKeys.Profile_Update.tr(),
                              style: AppTheme.lightTheme.textTheme.labelLarge!
                                  .copyWith(
                                fontSize: 16,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
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
