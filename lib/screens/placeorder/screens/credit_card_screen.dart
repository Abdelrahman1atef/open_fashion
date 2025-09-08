import 'package:flutter/material.dart';
import 'package:open_fashion/components/custom_app_bar.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/components/custom_title.dart';
import 'package:open_fashion/core/themes/text_styles.dart';
import 'package:open_fashion/gen/colors.gen.dart';
import 'package:open_fashion/models/order_model.dart';
import 'package:open_fashion/screens/check_out/screens/check_out_screen.dart';
import 'package:open_fashion/screens/placeorder/widgets/credit_card_widget.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key, required this.order});

  final OrderModel order;

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameOnCardController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expMonthController = TextEditingController();
  final _expDateController = TextEditingController();
  final _cvvController = TextEditingController();
  bool showBackView = false;
  @override
  void initState() {
    super.initState();
    // Add focus listener to CVV field to flip card back to front when CVV loses focus
    _cvvController.addListener(() {
      if (_cvvController.text.isEmpty) {
        setState(() {
          showBackView = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _nameOnCardController.dispose();
    _cardNumberController.dispose();
    _expMonthController.dispose();
    _expDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.whiteColor,
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomButton(
        text: "Add Card",
        isIconVisible: false,
        onTap: _saveCard,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTitle(title: "Payment method"),
            SizedBox(height: 20),

            // // Credit Card Preview
            // CreditCardWidget(
            //   cardNumber: _cardNumberController.text,
            //   expiryDate: "${_expMonthController.text}/${_expDateController.text}",
            //   cardHolderName: "Ahmed",

            //   cvvCode: _cvvController.text,
            //   showBackView: showBackView,
            //   onCreditCardWidgetChange: (value) {
            //     // Card brand detected: value.brandName
            //     print("*");
            //   },
            // ),
            CustomCreditCardWidget(
              nameOnCardController: _nameOnCardController,
              cardNumberController: _cardNumberController,
              expMonthController: _expMonthController,
              expDateController: _expDateController,
              cvvController: _cvvController,
              showBackView: showBackView,
            ),
            SizedBox(height: 30),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                    controller: _nameOnCardController,
                    label: "Name On Card",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Name On Card';
                      }
                      return null;
                    },
                    onChanged: () => setState(() {}), // Update preview
                          onTap: () => setState(() {showBackView?showBackView = !showBackView:null;}),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    controller: _cardNumberController,
                    label: "Card Number",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Card Number';
                      }
                      if (value.length < 16) {
                        return 'Card number must be 16 digits';
                      }
                      return null;
                    },
                    onChanged: () => setState(() {}), // Update preview
                          onTap: () => setState(() {showBackView?showBackView = !showBackView:null;}),
                  isCardNumber: true
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: _expMonthController,
                          label: "Exp Month",
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Exp Month';
                            }
                            if (int.tryParse(value) == null ||
                                int.parse(value) < 1 ||
                                int.parse(value) > 12) {
                              return 'Invalid month';
                            }
                            return null;
                          },
                          onChanged: () => setState(() {}), // Update preview
                          onTap: () => setState(() {showBackView?showBackView = !showBackView:null;}),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: _buildTextField(
                          controller: _expDateController,
                          label: "Exp Year",
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Exp Year';
                            }
                            if (int.tryParse(value) == null ||
                                value.length != 2) {
                              return 'Invalid year';
                            }
                            return null;
                          },
                          onChanged: () => setState(() {}), // Update preview
                          onTap: () => setState(() {showBackView?showBackView = !showBackView:null;}),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    controller: _cvvController,
                    label: "CVV",
                          onChanged: () => setState(() {}), // Update preview
                          onTap:() => setState(() {showBackView = !showBackView;}),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter CVV';
                      }
                      if (value.length < 3) {
                        return 'CVV must be 3 digits';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    VoidCallback? onChanged,
    VoidCallback? onTap,
    bool? isCardNumber
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged != null ? (_) => onChanged() : null,
      onTap: onTap,
      maxLength: isCardNumber ==true?16:null,
      style: TextStyles.subTitle.copyWith(
        fontSize: 16,
        color: ColorName.priceColor,
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

  void _saveCard() {
    if (_formKey.currentState!.validate()) {
      // Create payment model
      final paymentModel = PaymentModel(
        nameOnCart: _nameOnCardController.text,
        cardNumber: _cardNumberController.text,
        expMonth: _expMonthController.text,
        expDate: _expDateController.text,
        cvv: _cvvController.text,
      );

      // Update the order model
      OrderModel.order = OrderModel(
        address: OrderModel.order?.address,
        payment: paymentModel,
        products: OrderModel.order?.products,
        total: OrderModel.order?.total,
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Credit card added successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate back
      Navigator.push(context,MaterialPageRoute(builder: (context) => CheckOutScreen(),));
    }
  }
}
