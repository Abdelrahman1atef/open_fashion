import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/custom_app_bar.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/components/custom_title.dart';
import 'package:open_fashion/core/themes/text_styles.dart';
import 'package:open_fashion/gen/colors.gen.dart';
import 'package:open_fashion/models/order_model.dart';

class AddShippingAddressScreen extends StatefulWidget {
  const AddShippingAddressScreen({
    super.key,
    required this.order,
    this.addressId,
  });
  final OrderModel order;
  final int? addressId;
  @override
  State<AddShippingAddressScreen> createState() =>
      _AddShippingAddressScreenState();
}

class _AddShippingAddressScreenState extends State<AddShippingAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  List<AddressModel>? addresses;

  @override
  void initState() {
    super.initState();
    // Debug: Print all the data step by step
    print("=== DEBUGGING ORDER DATA ===");
    print("1. widget.order: ${widget.order}");
    print("2. widget.order.address: ${widget.order.address}");
    print("3. widget.addressId: ${widget.addressId}");
    print("4. addresses: $addresses");
    print("5. addresses length: ${addresses?.length ?? 'null'}");
    
    // Get addresses from order
    addresses = widget.order.address;
    if (addresses != null &&
        widget.addressId != null &&
        widget.addressId! >= 0 &&
        widget.addressId! < addresses!.length) {
      final address = addresses![widget.addressId!];
      _firstNameController.text = address.firstName ?? "";
      _lastNameController.text = address.lastName ?? "";
      _addressController.text = address.address ?? "";
      _cityController.text = address.city ?? "";
      _stateController.text = address.state ?? "";
      _zipCodeController.text = address.zipCode ?? "";
      _phoneController.text = address.phone ?? "";
    } else {
      _firstNameController.text = "";
      _lastNameController.text = "";
      _addressController.text = "";
      _cityController.text = "";
      _stateController.text = "";
      _zipCodeController.text = "";
      _phoneController.text = "";
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.whiteColor,
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomButton(
        text: "Add now",
        isIconVisible: false,
        onTap: _saveAddress,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              CustomTitle(title: "Add shipping address"),
              Gap(25),
              // Name Fields
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _firstNameController,
                      label: "First Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: _buildTextField(
                      controller: _lastNameController,
                      label: "Last Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter last name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Gap(20),
              // Address Field
              _buildTextField(
                controller: _addressController,
                label: "Address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                },
              ),
              Gap(20),
              // City,
              _buildTextField(
                controller: _cityController,
                label: "City",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
              ),
              Gap(20),
              // State, Zip Row
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _stateController,
                      label: "State",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter state';
                        }
                        return null;
                      },
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: _buildTextField(
                      controller: _zipCodeController,
                      label: "ZIP Code",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter ZIP code';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Gap(20),
              // Phone Field
              _buildTextField(
                controller: _phoneController,
                label: "Phone number",
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyles.subTitle.copyWith(
        fontSize: 16,
        color: ColorName.blackColor,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyles.subTitle.copyWith(
          fontSize: 16,
          color: ColorName.blackColor,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorName.grayColor3),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorName.grayColor3),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorName.blackColor, width: 2),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      // Get current addresses list
      final currentAddresses = OrderModel.order?.address ?? [];

      AddressModel newAddress;

      if (widget.addressId != null &&
          widget.addressId! < currentAddresses.length) {
        // Update existing address
        newAddress = currentAddresses[widget.addressId!].copyWith(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          address: _addressController.text,
          city: _cityController.text,
          state: _stateController.text,
          zipCode: _zipCodeController.text,
          phone: _phoneController.text,
        );

        // Replace the existing address in the list
        final updatedAddresses = List<AddressModel>.from(currentAddresses);
        updatedAddresses[widget.addressId!] = newAddress;

        OrderModel.order = OrderModel(
          address: updatedAddresses,
          payment: OrderModel.order?.payment,
          products: OrderModel.order?.products,
          total: OrderModel.order?.total,
        );
      } else {
        // Add new address to the list
        newAddress = AddressModel(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          address: _addressController.text,
          city: _cityController.text,
          state: _stateController.text,
          zipCode: _zipCodeController.text,
          phone: _phoneController.text,
        );

        // Add new address to the list
        final updatedAddresses = [...currentAddresses, newAddress];

        OrderModel.order = OrderModel(
          address: updatedAddresses,
          payment: OrderModel.order?.payment,
          products: OrderModel.order?.products,
          total: OrderModel.order?.total,
        );
      }

      // Show success message and go back
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.addressId != null
                ? 'Address updated successfully!'
                : 'Address added successfully!',
          ),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }
}
