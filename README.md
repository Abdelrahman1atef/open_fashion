# Open Fashion - Flutter E-Commerce App

A modern, elegant Flutter e-commerce application for fashion products with a complete shopping experience including product browsing, cart management, checkout flow, and payment processing.

## 📸 Screenshots

### 🏠 **Home Screen**

<img src="https://github.com/user-attachments/assets/91c796a9-7f24-4720-91db-7bd5a505de4b" alt="Home Screen 1" width="300">
<img src="https://github.com/user-attachments/assets/112b86ed-9c68-4976-ab1c-604b193e52d7" alt="Home Screen 2" width="300">
<img src="https://github.com/user-attachments/assets/d71f7d2c-73d5-439d-a396-044753788957" alt="Home Screen 3" width="300">

### 📦 **Checkout**

<img src="https://github.com/user-attachments/assets/fc48119f-131c-4eeb-a34d-9bcdc71189be" alt="Checkout 1" width="300">
<img src="https://github.com/user-attachments/assets/1a60b315-deb1-45a6-87dd-8a84fa704a80" alt="Checkout 2" width="300">
<img src="https://github.com/user-attachments/assets/6d5a81e1-d32d-4d51-a002-908a14f40276" alt="Checkout 3" width="300">
<img src="https://github.com/user-attachments/assets/3fa76a33-063d-48fd-ba64-8e88d560f69d" alt="Checkout 4" width="300">

### 💳 **Payment**

<img src="https://github.com/user-attachments/assets/292d6d5c-265a-442b-8319-e376213edbda" alt="Payment 1" width="300">
<img src="https://github.com/user-attachments/assets/47de8dec-d4c3-45fd-aa2e-6c2475cd81eb" alt="Payment 2" width="300">
<img src="https://github.com/user-attachments/assets/fe540c98-bbe0-4102-bc07-e17837e10912" alt="Payment 3" width="300">

### ✅ **Order Success**

<img src="https://github.com/user-attachments/assets/e6fbee4c-473c-4421-97c2-c377072135d8" alt="Pre-order Checked Success" width="300">

<img src="https://github.com/user-attachments/assets/ffffb4db-a096-49fd-a030-710d391e8f51" alt="Order Success" width="300">

## 🎨 Features

### 🏠 **Home Screen**
- Beautiful hero section with animated text overlays
- Product showcase with high-quality images
- "You May Also Like" recommendations
- Elegant footer with brand information

### 🛍️ **Product Management**
- Product catalog with 6 fashion items
- Detailed product information (name, price, description)
- Quantity selector for cart management
- Hero animations for smooth transitions

### 🛒 **Shopping Experience**
- **Place Order Flow**:
  - Shipping address management (add/edit multiple addresses)
  - Shipping method selection
  - Payment method selection
  - Credit card processing with real-time preview

### 💳 **Payment System**
- Interactive credit card form with live preview
- Card flipping animation (front/back view)
- Form validation for all payment fields
- Integration with `flutter_credit_card` package
- Secure payment processing

### 📦 **Checkout Process**
- Order summary with product details
- Address and payment method confirmation
- Total price calculation
- Success dialog with rating system

## 🏗️ **Project Structure**

```
lib/
├── components/           # Reusable UI components
│   ├── custom_app_bar.dart
│   ├── custom_button.dart
│   ├── custom_title.dart
│   ├── custom_add_select_widget.dart
│   └── custom_radio_list_tile.dart
├── core/
│   └── themes/
│       └── text_styles.dart
├── gen/                 # Generated assets and colors
│   ├── assets.gen.dart
│   ├── colors.gen.dart
│   └── fonts.gen.dart
├── models/              # Data models
│   ├── product_model.dart
│   ├── order_model.dart
│   └── cover_model.dart
├── screens/
│   ├── home/            # Home screen and widgets
│   ├── product_details/ # Product detail screen
│   ├── placeorder/      # Order placement flow
│   └── check_out/       # Checkout and payment success
└── main.dart
```

## 🎯 **Key Components**

### **Custom Components**
- **CustomAppBar**: Consistent navigation bar across screens
- **CustomButton**: Styled buttons with optional total price display
- **CustomTitle**: Standardized section titles
- **CustomAddSelectWidget**: Expandable selection widgets
- **CustomRadioListTile**: Reusable radio button components

### **Data Models**
- **ProductModel**: Product information and catalog
- **OrderModel**: Order management with addresses and payments
- **AddressModel**: Shipping address with auto-incrementing IDs
- **PaymentModel**: Credit card information and validation
- **ProductSelectedModel**: Cart items with quantity

## 🚀 **Getting Started**

### **Prerequisites**
- Flutter SDK (^3.9.0)
- Dart SDK
- Android Studio / VS Code
- Git

### **Installation**

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd open_fashion
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate assets**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 **Screens & Navigation**

### **Main Flow**
1. **Home** → Product browsing
2. **Product Details** → Add to cart
3. **Place Order** → Address, shipping, payment
4. **Credit Card** → Payment processing
5. **Checkout** → Order confirmation
6. **Payment Success** → Rating and completion

### **Key Screens**
- **Home Screen**: Product showcase with hero section
- **Product Details**: Individual product information
- **Place Order**: Multi-step checkout process
- **Credit Card Screen**: Interactive payment form
- **Checkout Screen**: Order summary and confirmation
- **Payment Success Dialog**: Completion with rating system

## 🎨 **Design System**

### **Colors**
- Generated from `assets/colors/colors.xml`
- Consistent color palette throughout the app
- Primary, secondary, and accent colors

### **Typography**
- **TenorSans** font family
- Consistent text styles and sizing
- Hierarchical typography system

### **Assets**
- SVG icons and illustrations
- High-quality product images
- Generated asset management with `flutter_gen`

## 🛠️ **Dependencies**

### **Core Dependencies**
- `flutter_svg`: SVG rendering
- `gap`: Consistent spacing
- `ionicons`: Icon library
- `flutter_credit_card`: Credit card UI components

### **Development Dependencies**
- `flutter_lints`: Code quality
- `build_runner`: Code generation
- `flutter_gen_runner`: Asset generation

## 🔧 **Development Features**

### **State Management**
- Stateless and Stateful widgets
- Local state management with `setState`
- Immutable data models with `copyWith` methods

### **Form Validation**
- Comprehensive form validation
- Real-time input validation
- User-friendly error messages

### **Animations**
- Hero animations for product transitions
- Credit card flipping animations
- Smooth page transitions

### **Responsive Design**
- Adaptive layouts for different screen sizes
- Consistent spacing and padding
- Mobile-first approach

## 📋 **Features Implemented**

✅ **Product Catalog Management**
✅ **Shopping Cart Functionality**
✅ **Multi-step Checkout Process**
✅ **Address Management System**
✅ **Payment Processing**
✅ **Credit Card Integration**
✅ **Order Confirmation**
✅ **Success Dialog with Rating**
✅ **Form Validation**
✅ **Responsive UI Design**
✅ **Asset Management**
✅ **Custom Component Library**

## 🎯 **Future Enhancements**

- [ ] User authentication system
- [ ] Order history and tracking
- [ ] Wishlist functionality
- [ ] Product search and filtering
- [ ] Push notifications
- [ ] Offline support
- [ ] Multi-language support
- [ ] Dark mode theme

## 📄 **License**

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 **Contributing**

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📞 **Support**

For support and questions, please open an issue in the repository.

---

**Built with ❤️ using Flutter**