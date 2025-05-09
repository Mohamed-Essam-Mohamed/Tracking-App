import 'dart:developer';
import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/features/auth/presentation/view/Success_apply.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/dialogs/app_dialogs.dart';
import '../../../../core/utils/validator.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/models/post_auth.dart';
import '../view_model/apply/apply_cubit.dart';
import '../view_model/apply/apply_state.dart';
import '../widgets/upload_image.dart';
import '../../domain/entities/vehicles_entitiy.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  final ApplyCubit apply = serviceLocator<ApplyCubit>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final vehicleNumberController = TextEditingController();
  final countryController = TextEditingController();
  final rePasswordController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final idNumberController = TextEditingController();
  final vehicleLicenseController = TextEditingController();
  final nidController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  File? NidImage;
  File? vehicleLicense;
  String? selectedCountry = 'Egypt';
  String? selectedVehicleType;
  String gender = 'female';
  VehiclesEntity? selectedVehicle;
  String flagEmoji = ' ';

  @override
  void initState() {
    super.initState();
    apply.getAllVehicles();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    vehicleNumberController.dispose();
    countryController.dispose();
    rePasswordController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    idNumberController.dispose();
    vehicleLicenseController.dispose();
    nidController.dispose();

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

  Future<void> _pickNIDImage() async {
    final image = await UploadImage.pickImage(context);
    if (image != null) {
      setState(() {
        NidImage = image;
        nidController.text = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => apply,
      child: BlocListener<ApplyCubit, ApplyState>(
        listener: (context, state) {
          if (state is ApplySuccessState) {
            log("Apply Success");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SuccessApply()),
            );
          } else if (state is ApplyErrorState) {
            log("Apply Error");

            AppDialogs.showFailureDialog(
              context,
              message: state.error,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            );
          } else if (state is ApplyLoadingState) {
            AppDialogs.showLoadingDialog(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.apply_Apply.tr(),
                style: AppTheme.lightTheme.textTheme.titleLarge),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
            iconTheme: IconThemeData(color: AppColors.black, size: 20),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.apply_Welcome.tr(),
                        style: AppTheme.lightTheme.textTheme.titleLarge),
                    Text(
                        "${LocaleKeys.apply_YouWantToBeADeliveryMan.tr()}\n${LocaleKeys.apply_JoinOurTeam.tr()}",
                        style: AppTheme.lightTheme.textTheme.titleSmall
                            ?.copyWith(color: AppColors.gray)),
                    SizedBox(height: 24),
                    TextFormField(
                      readOnly: true,
                      controller:
                          TextEditingController(text: "$flagEmoji $selectedCountry"),
                      decoration: InputDecoration(
                        labelText: LocaleKeys.apply_Country.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                          onPressed: () {
                            showCountryPicker(
                              context: context,
                              onSelect: (Country country) {
                                setState(() {
                                  selectedCountry = country.name;
                                  flagEmoji = country.flagEmoji;
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(LocaleKeys.apply_SelectedCountry.tr() +
                                        country.name),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.apply_FirstLegalName.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        hintText: LocaleKeys.apply_EnterFirstLegalName.tr(),
                        hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: (val) => Validator.validateName(val),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.apply_SecondLegalName.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        hintText: LocaleKeys.apply_EnterSecondLegalName.tr(),
                        hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: (val) => Validator.validateName(val),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: selectedVehicleType,
                      items: apply.vehiclesList.map((vehicle) {
                        return DropdownMenuItem(
                          value: vehicle.id,
                          child: Text(
                            vehicle.type ?? LocaleKeys.apply_Unknown.tr(),
                            style: AppTheme.lightTheme.textTheme.labelMedium,
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: LocaleKeys.apply_VehicleType.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      icon: Icon(Icons.keyboard_arrow_down_sharp),
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleType = value;
                          selectedVehicle = apply.vehiclesList.firstWhere(
                            (vehicle) => vehicle.id == selectedVehicleType,
                          );
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: vehicleNumberController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.apply_VehicleNumber.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        hintText: LocaleKeys.apply_EnterVehicleNumber.tr(),
                        hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: (val) => Validator.validateVehicleNumber(val),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      readOnly: true,
                      controller: vehicleLicenseController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.apply_VehicleLicense.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        hintText: LocaleKeys.apply_UploadLicensePhoto.tr(),
                        hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        suffixIcon: InkWell(
                          onTap: _pickVehicleLicenseImage,
                          child: Icon(Icons.file_upload_outlined),
                        ),
                      ),
                      validator: (val) => Validator.validateUpload(val),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      validator: (val) => Validator.validateEmail(val),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.Authentication_Email.tr(),
                        hintText: LocaleKeys.Authentication_EnterYourEmail.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.apply_PhoneNumber.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        hintText: LocaleKeys.apply_EnterPhoneNumber.tr(),
                        hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (val) => Validator.validatePhoneNumber(val),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: idNumberController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.apply_IDNumber.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        hintText: LocaleKeys.apply_EnterNationalIDNumber.tr(),
                        hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: (val) => Validator.validateIdNumber(val),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      readOnly: true,
                      controller: nidController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.apply_IDImage.tr(),
                        labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        hintText: LocaleKeys.apply_UploadIDImage.tr(),
                        hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        suffixIcon: InkWell(
                          onTap: _pickNIDImage,
                          child: Icon(Icons.file_upload_outlined),
                        ),
                      ),
                      validator: (val) => Validator.validateUpload(val),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.apply_Password.tr(),
                              labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                                  ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                              hintText: LocaleKeys.apply_EnterPassword.tr(),
                              hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                                  ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.black),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            validator: (val) => Validator.validatePassword(val),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: rePasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.apply_ConfirmPassword.tr(),
                              labelStyle: AppTheme.lightTheme.textTheme.labelMedium
                                  ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                              hintText: LocaleKeys.apply_ConfirmPassword.tr(),
                              hintStyle: AppTheme.lightTheme.textTheme.labelMedium
                                  ?.copyWith(color: AppColors.gray.withOpacity(0.8)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.black),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            validator: (val) => Validator.validateConfirmPassword(
                                val, passwordController.text),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.apply_Gender.tr(),
                          style: AppTheme.lightTheme.textTheme.titleMedium,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Radio<String>(
                          //focusColor: AppColors.gray,
                          value: 'female',
                          groupValue: gender,
                          onChanged: (value) => setState(() => gender = value!),
                        ),
                        Text(LocaleKeys.apply_Female.tr(),
                            style: AppTheme.lightTheme.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.gray)),
                        Radio<String>(
                          value: 'male',
                          groupValue: gender,
                          onChanged: (value) => setState(() => gender = value!),
                        ),
                        Text(
                          LocaleKeys.apply_Male.tr(),
                          style: AppTheme.lightTheme.textTheme.bodyMedium
                              ?.copyWith(color: AppColors.gray),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.pink[700],
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Text(LocaleKeys.apply_Continue.tr(),
                            style: TextStyle(fontSize: 16)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (vehicleLicense == null || NidImage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(LocaleKeys
                                        .apply_UploadVehicleLicenseAndIDImage
                                        .tr())),
                              );
                              return;
                            }

                            final postAuth = PostAuth(
                              email: emailController.text,
                              phone: phoneController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              vehicleType: selectedVehicleType!,
                              vehicleLicense: vehicleLicense!,
                              NID: idNumberController.text,
                              NIDImg: NidImage!,
                              country: selectedCountry!,
                              gender: gender,
                              password: passwordController.text,
                              rePassword: rePasswordController.text,
                              vehicleNumber: vehicleNumberController.text,
                            );
                            apply.signup(postAuth);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
