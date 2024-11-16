import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:invoicify/widgets/app_text.dart';
import 'package:invoicify/widgets/button.dart';
import 'package:intl/intl.dart';

class TaxpayerPage extends StatefulWidget {
  const TaxpayerPage({super.key});

  @override
  State<TaxpayerPage> createState() => _TaxpayerPageState();
}

class _TaxpayerPageState extends State<TaxpayerPage> {
  final TextEditingController vendorTINController = TextEditingController();
  final TextEditingController invoiceNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemCodeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController itemDescriptionController =
      TextEditingController();
  final TextEditingController businessPartnerController =
      TextEditingController();
  final TextEditingController businessTINController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isTaxInclusive = true;
  bool isTaxable = true;
  bool isDiscount = false;
  String selectedTourismOrCST = "None";
  String selectedItemCategory = "Regular VAT";
  String selectedBusinessPartner = "Customer";
  String selectedCurrency = "GHS";

  // OPTIONS
  final List<String> tourismOrCSTOptions = ['None', 'Tourism', 'CST'];
  final List<String> itemCategoryOptions = ['Regular VAT', 'Rent', 'Exempt'];
  final List<String> businessPartnerOptions = [
    'Customer',
    'Supplier',
    "Exempt"
  ];
  final List<String> currencyOptions = ["GHS", "USD", "EUR", "GBP"];
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    priceController.addListener(_updateTotalAmount);
    quantityController.addListener(_updateTotalAmount);
    filteredItems = items;
  }

  // filter items added
  void _filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) =>
              item['name'].toLowerCase().contains(query.toUpperCase()))
          .toList();
    });
  }

  // Date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (date != null) {
      setState(() {
        // Format the picked date and display it in the text field
        dateController.text = DateFormat('yyyy-MM-dd').format(date);
      });
    }
  }

  // Time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      // Format the TimeOfDay manually to 'HH:mm'
      final String formattedTime = time.format(context);

      setState(() {
        timeController.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(62, 180, 137, 1),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(163, 201, 226, 1.5),
              Color.fromRGBO(150, 24, 247, 0.5),
              Color.fromRGBO(246, 239, 167, 0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      title: "Enter details to issue an invoice",
                      fontSize: 25,
                    ),
                    const SizedBox(height: 20.0),
                    const AppText(
                      title: "Invoice Date",
                      fontSize: 18,
                    ),

                    // Invoice Date
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            child: TextFormField(
                              readOnly: true,
                              enabled: false,
                              controller: dateController,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: 'Invoice Date',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              ),
                              onChanged: (value) {
                                print('Invoice Date: $value');
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: const Icon(Icons.calendar_today))
                      ],
                    ),

                    // Invoice Time
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            child: TextFormField(
                              readOnly: true,
                              enabled: false,
                              controller: timeController,
                              decoration: InputDecoration(
                                labelText: 'Invoice Time',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              ),
                              onChanged: (value) {
                                print('Invoice Time: $value');
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        IconButton(
                            onPressed: () {
                              _selectTime(context);
                            },
                            icon: const Icon(Icons.timer))
                      ],
                    ),
                    const AppText(
                      title: "Please select document type",
                      fontSize: 18,
                    ),
                    Wrap(
                      spacing: 12.0,
                      runSpacing: 12.0,
                      children: [
                        Button(
                          buttonText: "Invoice",
                          onTap: () {},
                          colors: Colors.white,
                          fontSize: 16,
                        ),
                        Button(
                          buttonText: "Purchase",
                          onTap: () {},
                          colors: Colors.white,
                          fontSize: 16,
                        ),
                        Button(
                          buttonText: "Refund",
                          onTap: () {},
                          colors: Colors.white,
                          fontSize: 16,
                        ),
                        Button(
                          buttonText: "Credit Note",
                          onTap: () {},
                          colors: Colors.white,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Business Partner section
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            child: TextFormField(
                              controller: businessPartnerController,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: 'Business Partner',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Button(
                          buttonText: "Add Partner",
                          onTap: () {},
                          size: const Size(110, 55),
                          colors: Colors.white,
                          fontSize: 16,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _showBusinessModal(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Vendor information text field
                    Form(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your vendor TIN';
                          }
                          return null;
                        },
                        controller: vendorTINController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Vendor TIN',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    //Username text field
                    Form(
                      child: TextFormField(
                        controller: usernameController,
                        enabled: false,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Invoice number text field
                    Form(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your invoice number';
                          }
                          return null;
                        },
                        controller: invoiceNumberController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Invoice Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Total amount text field
                    Form(
                      child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        controller: totalAmountController,
                        onChanged: (value) {
                          _updateTotalAmount();
                        },
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: InputDecoration(
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Total Amount',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const AppText(title: 'Items', fontSize: 18),
                    const SizedBox(height: 15),

                    //Item section
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            child: TextFormField(
                              controller: itemNameController,
                              onChanged: _filterItems,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: "Item",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Button(
                          buttonText: "Add Item",
                          onTap: () {},
                          size: const Size(110, 55),
                          colors: Colors.white,
                          fontSize: 16,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _showItemModal(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Quantity text field
                    Form(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: quantityController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Quantity',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Price text field
                    Form(
                        child: TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: priceController,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: "Price",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )),
                    const SizedBox(
                      height: 15,
                    ),

                    Center(
                      child: Button(
                        buttonText: 'Submit Invoice',
                        onTap: _submitForm,
                        size: const Size(160, 55),
                        colors: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to submit the form or payload
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Form is valid, submitting...');
    }
  }

  // Shows the item Modal
  void _showItemModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            content: Container(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppText(
                    title: 'Set up a Product or a Service',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),

                  // Item code text field
                  Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Item Code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Item name controller text field
                  Form(
                    child: TextFormField(
                      controller: itemNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your product name / service name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Item Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // price controller text field
                  Form(
                    child: TextFormField(
                      controller: priceController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your price';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // currency controller text field
                  DropdownButtonFormField<String>(
                    value: selectedCurrency,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Currency',
                    ),
                    items: currencyOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrency = newValue!;
                      });
                    },
                  ),
                  // Form(
                  //   child: TextFormField(
                  //     controller: currencyController,
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Please enter your currency';
                  //       }
                  //       return null;
                  //     },
                  //     decoration: InputDecoration(
                  //       labelText: 'Currency',
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 15),

                  // tax inclusive checkbox field
                  CheckboxListTile(
                    title: const AppText(
                      title: "Tax Inclusive?",
                    ),
                    value: isTaxInclusive,
                    onChanged: (bool? value) {
                      setState(() {
                        isTaxInclusive = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),

                  // item description text field
                  Form(
                    child: TextFormField(
                      controller: itemDescriptionController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: 'Item Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  // taxable checkbox text field
                  CheckboxListTile(
                    title: const AppText(
                      title: "Taxable?",
                    ),
                    value: isTaxable,
                    onChanged: (bool? value) {
                      setState(() {
                        isTaxable = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.platform,
                  ),

                  // tourism or CST dropdown
                  DropdownButtonFormField<String>(
                    value: selectedTourismOrCST,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Tourism/CST',
                    ),
                    items: tourismOrCSTOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTourismOrCST = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 15),

                  //item category dropdown
                  DropdownButtonFormField<String>(
                    value: selectedItemCategory,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Item Category',
                    ),
                    items: itemCategoryOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedItemCategory = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // discount section
                  CheckboxListTile(
                    title: const AppText(title: "Apply Discount"),
                    value: isDiscount,
                    controlAffinity: ListTileControlAffinity.platform,
                    onChanged: (value) {
                      setState(() {
                        isTaxable = value!;
                      });
                    },
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
              Button(
                buttonText: "Add Item",
                onTap: () {
                  _addItems();
                  Navigator.pop(context);
                },
                colors: Colors.white,
              )
            ],
          ),
        );
      },
    );
  }

  // Adds new items to the items list
  void _addItems() {
    if (itemNameController.text.isEmpty &&
        priceController.text.isEmpty &&
        currencyController.text.isEmpty) {
      "Please fill in the required fields";
    }

    final newItem = {
      'itemCode': itemCodeController.text,
      'name': itemNameController.text,
      'price': double.tryParse(priceController.text) ?? 0.0,
      'currency': currencyController.text,
      'taxInclusive': isTaxInclusive,
      'description': itemDescriptionController.text,
      'isTaxable': isTaxable,
      'itemOption': selectedTourismOrCST,
      'category': selectedItemCategory,
      'isDiscount': isDiscount
    };

    items.add(newItem);

    setState(() {
      // itemNameController.clear();
      // priceController.clear();
      // currencyController.clear();
      // isTaxInclusive = true;
      // itemDescriptionController.clear();
      // isTaxable = true;
      // selectedTourismOrCST = "None";
      // selectedItemCategory = "Regular VAT";
    });
  }

  // Adds new items to the items list
  void _addPartner() {
    if (businessPartnerController.text.isEmpty &&
        businessTINController.text.isEmpty &&
        emailController.text.isEmpty &&
        contactController.text.isEmpty) {
      "Please fill in the required fields";
    }

    final newPartner = {
      'businessName': businessPartnerController.text,
      'businessTIN': businessTINController.text,
      'businessOptions': businessPartnerOptions,
      'email': emailController.text,
      'contact': contactController.text,
    };

    items.add(newPartner);

    setState(() {
      // itemNameController.clear();
      // priceController.clear();
      // currencyController.clear();
      // isTaxInclusive = true;
      // itemDescriptionController.clear();
      // isTaxable = true;
      // selectedTourismOrCST = "None";
      // selectedItemCategory = "Regular VAT";
    });
  }

  // Shows the Business Modal
  void _showBusinessModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const AppText(
              title: "Setup a Business Partner",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  child: TextFormField(
                    controller: businessPartnerController,
                    decoration: InputDecoration(
                      labelText: 'Business Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField<String>(
                  value: selectedBusinessPartner,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Type',
                  ),
                  items: businessPartnerOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBusinessPartner = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 15),
                Form(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Business TIN',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Form(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Form(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: contactController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Center(
                //   child: Button(buttonText: "Add Partner", onTap: () {}),
                // )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
              Button(
                buttonText: "Add",
                onTap: () {
                  _addPartner();
                  Navigator.pop(context);
                },
                colors: Colors.white,
              )
            ],
          );
        });
  }

  // Shows the updated total amount
  void _updateTotalAmount() {
    final double price = double.tryParse(priceController.text) ?? 0.0;
    final int quantity = int.tryParse(quantityController.text) ?? 0;
    final double totalAmount = price * quantity;
    totalAmountController.text = totalAmount.toStringAsFixed(2);
  }

  @override
  void dispose() {
    priceController.removeListener(_updateTotalAmount);
    quantityController.removeListener(_updateTotalAmount);
    // priceController.dispose();
    quantityController.dispose();
    totalAmountController.dispose();
    super.dispose();
  }
}
