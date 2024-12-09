// import 'package:flutter/material.dart';
// import 'package:invoicify/widgets/app_text.dart';
// import 'package:invoicify/widgets/button.dart';

// class ShowItemModal extends StatefulWidget {
//   const ShowItemModal({
//     Key? key,
//   });

//   @override
//   State<ShowItemModal> createState() => _ShowItemModalState();
// }

// class _ShowItemModalState extends State<ShowItemModal> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController itemCodeController = TextEditingController();

//   final TextEditingController itemNameController = TextEditingController();

//   final TextEditingController itemDescriptionController =
//       TextEditingController();

//   final TextEditingController quantityController = TextEditingController();

//   final TextEditingController priceController = TextEditingController();

//   bool isTaxInclusive = true;

//   bool isTaxable = true;

//   bool isDiscount = false;

//   bool isActive = false;

//   String selectedTourismOrCST = "None";

//   String selectedItemCategory = "Regular VAT";

//   String selectedBusinessPartner = "Customer";

//   String selectedCurrency = "GHS";

//   final List<String> currencyOptions = ["GHS", "USD", "EUR", "GBP"];

//   // OPTIONS
//   final List<String> tourismOrCSTOptions = ['None', 'Tourism', 'CST'];

//   final List<String> itemCategoryOptions = ['Regular VAT', 'Rent', 'Exempt'];

//   List<Map<String, dynamic>> items = [];
//   List<Map<String, dynamic>> filteredItems = [];

//   // final Function onAddItem;
//   void _filterItems(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         filteredItems = List.from(items);
//       } else {
//         filteredItems = items
//             .where((item) =>
//                 item[1].toString().toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: Container(
//               constraints: const BoxConstraints(maxWidth: 650),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const AppText(
//                         title: 'Set up a Product or a Service',
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       const SizedBox(height: 10),

//                       // Item Code Field
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Item Code',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),

//                       // Item Name Field
//                       TextFormField(
//                         controller: itemNameController,
//                         decoration: InputDecoration(
//                           labelText: 'Item Name',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),

//                       // Price Field
//                       TextFormField(
//                         controller: priceController,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           labelText: 'Price',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),

//                       // Currency Dropdown
//                       DropdownButtonFormField<String>(
//                         value: selectedCurrency,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           labelText: 'Currency',
//                         ),
//                         items: currencyOptions.map((String option) {
//                           return DropdownMenuItem<String>(
//                             value: option,
//                             child: Text(option),
//                           );
//                         }).toList(),
//                         onChanged: (_) {},
//                       ),
//                       const SizedBox(height: 15),

//                       // Tax Inclusive Checkbox
//                       CheckboxListTile(
//                         title: const AppText(title: "Tax Inclusive?"),
//                         value: isTaxInclusive,
//                         onChanged: (_) {},
//                       ),

//                       // Item Description Field
//                       TextFormField(
//                         controller: itemDescriptionController,
//                         maxLines: 2,
//                         decoration: InputDecoration(
//                           labelText: 'Item Description',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),

//                       // Taxable Checkbox
//                       CheckboxListTile(
//                         title: const AppText(title: "Taxable?"),
//                         value: isTaxable,
//                         onChanged: (_) {},
//                       ),

//                       // Tourism/CST Dropdown
//                       DropdownButtonFormField<String>(
//                         value: selectedTourismOrCST,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           labelText: 'Tourism/CST',
//                         ),
//                         items: tourismOrCSTOptions.map((String option) {
//                           return DropdownMenuItem<String>(
//                             value: option,
//                             child: Text(option),
//                           );
//                         }).toList(),
//                         onChanged: (_) {},
//                       ),
//                       const SizedBox(height: 15),

//                       // Item Category Dropdown
//                       DropdownButtonFormField<String>(
//                         value: selectedItemCategory,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           labelText: 'Item Category',
//                         ),
//                         items: itemCategoryOptions.map((String option) {
//                           return DropdownMenuItem<String>(
//                             value: option,
//                             child: Text(option),
//                           );
//                         }).toList(),
//                         onChanged: (_) {},
//                       ),
//                       const SizedBox(height: 15),

//                       // Discount Checkbox
//                       CheckboxListTile(
//                         title: const AppText(title: "Apply Discount"),
//                         value: isDiscount,
//                         onChanged: (_) {},
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Close'),
//               ),
//               Button(
//                 buttonText: "Add Item",
//                 fontSize: 17,
//                 onTap: () {
//                   _addItems();
//                   Navigator.pop(context);
//                 },
//                 colors: Colors.blueGrey,
//               ),
//             ],
//           );
//         });
//   }

//   // Adds new items to the items list
//   void _addItems() {
//     if (itemNameController.text.isNotEmpty && priceController.text.isNotEmpty) {
//       Map<String, dynamic> newItem = {
//         'id': items.length + 1,
//         'itemCode': itemCodeController.text,
//         'name': itemNameController.text,
//         'price': double.tryParse(priceController.text) ?? 0.0,
//         'currency': selectedCurrency,
//         'isTaxInclusive': isTaxInclusive,
//         'description': itemDescriptionController.text,
//         'isTaxable': isTaxable,
//         'tourismOrCST': selectedTourismOrCST,
//         'category': selectedItemCategory,
//         'isDiscount': isDiscount
//       };

//       items.add(newItem);
//       filteredItems = items;

//       // // Clear form fields
//       itemCodeController.clear();
//       itemNameController.clear();
//       priceController.clear();
//       quantityController.clear();
//       itemDescriptionController.clear();
//       setState(() {});
//     } else {
//       // Debugging: Print a message if the conditions are not met
//       print('Item name or price is empty');
//     }
//   }
// }
