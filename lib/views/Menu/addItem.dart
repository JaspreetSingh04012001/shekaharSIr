import 'package:admin/Models/item.dart';
import 'package:admin/Models/itemsVariation.dart';
import 'package:admin/Services/utils.dart';
import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/common/reusable%20widgets/designedTextField.dart';
import 'package:admin/common/reusable%20widgets/myDropdown.dart';
import 'package:admin/controllers/inventoryController.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:admin/reuseable%20Widgets/animated_dialog.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:admin/views/OutletManager/addDepartment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import 'package:throttling/throttling.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String? selectedDepartment;
  List<ItemVariation> Variations = [];
  final List<String> departements = [
    'kitchen',
    'Bar',
  ];
  String? selectedCategory;
  List<String>? catrgories;
  String? selectedType;
  final List<String> foodTypes = [
    'Veg',
    'Non-Veg',
    'Egg Made',
  ];
  final deb = Debouncing(duration: const Duration(seconds: 1));
  TextEditingController itemCode = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController qtx = TextEditingController();
  TextEditingController taxGst = TextEditingController();
  TextEditingController cess = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController altName = TextEditingController();

  bool idAlreadyExists = false;
  bool isUnit = false;
  bool isFinishedGood = false;
  bool isDiscountAble = false;
  bool isTaxGst = false;
  bool isRateDeciaml = false;
  bool isInclusive = false; //Inclusive/extra (for tax)
  bool isAltName = false; //Inclusive/extra (for tax)
  bool isVeg = false;
  bool isNonVeg = false;
  bool isEggMade = false;
  final _formKey = GlobalKey<FormState>();
  final _variationformKey = GlobalKey<FormState>();

  List<String> types = ["Veg", "Non-Veg", "Egg-Made"];

  Widget y = Container();

  void reset() {
    setState(() {
      idAlreadyExists = false;
      isFinishedGood = false;
      isDiscountAble = false;
      isTaxGst = false;
      isRateDeciaml = false;
      isInclusive = false; //Inclusive/extra (for tax)
      isAltName = false; //Inclusive/extra (for tax)
      isVeg = false;
      isUnit = false;
      isNonVeg = false;
      isEggMade = false;
      selectedDepartment = null;
      selectedCategory = null;
      selectedType = null;
      y = Container();

      itemCode.clear();

      name.clear();
      rate.clear();
      qtx.clear();
      taxGst.clear();
      discount.clear();
      unit.clear();
      altName.clear();
      Variations.clear();
    });
  }

  @override
  void initState() {
    catrgories = Get.find<OutletsController>().selelctedOutlet!.categories;

    // TODO: implement initState
    super.initState();
  }

  // final _menuItem = MenuItem(name: '', description: '', price: 0.0);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 2;
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Add Item in Menu",
          style: Styles.poppins18w600,
        ),
      ),
      body: GetBuilder<InventoryController>(initState: (state) {
        // Get.find<InventoryController>().updateItemsList();
      }, builder: (inventoryController) {
        print(inventoryController.autoCodes);
        Widget form = SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (inventoryController.autoCodes != null)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Last Given Id : ${inventoryController.autoCodes.last}"),
                        ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment: MainAxisAlignment.,
                              children: [
                                DesignedTextField(
                                  onChanged: (p0) {
                                    deb.debounce(() {
                                      inventoryController.updateItemsList();
                                      if (inventoryController.autoCodes
                                          .contains(p0)) {
                                        setState(() {
                                          idAlreadyExists = true;
                                        });
                                        //Debounce.milliseconds(1000, print, ["Debounce World!"]);

                                        Get.snackbar(
                                          "Id Already Exists",
                                          "Please enter diiferent Id",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                        );
                                      } else {
                                        setState(() {
                                          idAlreadyExists = false;
                                        });
                                      }
                                    });
                                  },
                                  controller: itemCode,
                                  labelText: 'Item id',
                                  validate: (value) {
                                    if (value!.isEmpty ||
                                        inventoryController.autoCodes
                                            .contains(value)) {
                                      setState(() {
                                        idAlreadyExists = false;
                                      });
                                      return 'Please enter different Item id';
                                    }
                                    return null;
                                  },
                                ),
                                idAlreadyExists
                                    ? Text(
                                        "Id Already Exists",
                                        style: Styles.poppins14
                                            .copyWith(color: Colors.red),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MyDropdown(
                                  y: y,
                                  labelText: 'Select Department',
                                  list: departements,
                                  selectedValue: selectedDepartment,
                                  onChanged: (value) {
                                    //print(value);
                                    setState(() {
                                      selectedDepartment = value;
                                    });
                                  },
                                ),
                                const Gap(5),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      DesignedTextField(
                        controller: name,
                        labelText: 'Item name',
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Item Name';
                          }
                          return null;
                        },

                        // _menuItem.description = value!;
                      ),

                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                MyDropdown(
                                  y: y,
                                  list: catrgories != null
                                      ? [
                                          ...?Get.find<OutletsController>()
                                              .selelctedOutlet!
                                              .categories,
                                          '+ Add Category'
                                        ]
                                      : ['+ Add Category'],
                                  selectedValue: selectedCategory,
                                  onChanged: (value) {
                                    //print(value);
                                    if (value == '+ Add Category') {
                                      showAnimatedDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: AddDepartment(
                                                department: false,
                                              ),
                                            );
                                          });
                                    } else {
                                      setState(() {
                                        selectedCategory = value;
                                      });
                                    }
                                  },
                                  labelText: 'Select Category',
                                ),
                              ],
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            flex: 1,
                            child: MyDropdown(
                              y: y,
                              list: types,
                              selectedValue: selectedType,
                              onChanged: (value) {
                                //print(value);
                                setState(() {
                                  selectedType = value;
                                });
                              },
                              labelText: 'Select Type',
                            ),
                          ),
                        ],
                      ),

                      const Gap(15),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DesignedTextField(
                              inputFormatters: isRateDeciaml
                                  ? [
                                      NumberTextInputFormatter(
                                          decimalDigits: 2,
                                          decimalSeparator: '.')
                                    ]
                                  : [NumberTextInputFormatter()],
                              keyboardType: TextInputType.number,
                              labelText: 'Rate',
                              controller: rate,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the price';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      side: const BorderSide(
                                        width: 3,
                                        color: Colors
                                            .black, // Add a border to make it more visible
                                      ),
                                    ),
                                    activeColor: const Color.fromARGB(
                                        255,
                                        7,
                                        82,
                                        9), // Customize the checkbox's color when checked
                                    checkColor: Colors
                                        .white, // Customize the check icon's color
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      // Customize the checkbox's color when unchecked
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return const Color.fromARGB(255, 7, 82,
                                            9); // Make it semi-transparent when unchecked
                                      }
                                      return Colors.black;
                                    }),
                                    value: isRateDeciaml,
                                    onChanged: (v) {
                                      setState(() {
                                        isRateDeciaml = !isRateDeciaml;
                                      });
                                    }),
                                // const Gap(5),
                                Text(
                                  "Decimal",
                                  style: Styles.poppins14,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),

                      Row(
                        children: [
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                side: const BorderSide(
                                  width: 3,
                                  color: Colors
                                      .black, // Add a border to make it more visible
                                ),
                              ),
                              activeColor: Colors
                                  .blue, // Customize the checkbox's color when checked
                              checkColor: Colors
                                  .white, // Customize the check icon's color
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                // Customize the checkbox's color when unchecked
                                if (states.contains(MaterialState.selected)) {
                                  return Styles
                                      .primaryColor; // Make it semi-transparent when unchecked
                                }
                                return Colors.black;
                              }),
                              value: isUnit,
                              onChanged: (v) {
                                setState(() {
                                  isUnit = !isUnit;
                                });
                              }),
                          Text(
                            "Unit",
                            style: Styles.poppins14,
                          ),
                          const Gap(5),
                          if (isUnit)
                            Expanded(
                              child: DesignedTextField(
                                controller: unit,
                                labelText:
                                    'Please enter unit  (for eg. KG,gms,litre)',
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                        ],
                      ),

                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: const BorderSide(
                                      width: 3,
                                      color: Colors
                                          .black, // Add a border to make it more visible
                                    ),
                                  ),
                                  activeColor: Colors
                                      .blue, // Customize the checkbox's color when checked
                                  checkColor: Colors
                                      .white, // Customize the check icon's color
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    // Customize the checkbox's color when unchecked
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Styles
                                          .primaryColor; // Make it semi-transparent when unchecked
                                    }
                                    return Colors.black;
                                  }),
                                  value: isFinishedGood,
                                  onChanged: (v) {
                                    setState(() {
                                      isFinishedGood = !isFinishedGood;
                                    });
                                  }),
                              Text(
                                "Finished good",
                                style: Styles.poppins14,
                              ),
                              const Gap(5),
                              if (isFinishedGood)
                                Expanded(
                                    flex: 1,
                                    child: DesignedTextField(
                                      labelText: 'Quantity',
                                      controller: qtx,
                                      inputFormatters: [
                                        NumberTextInputFormatter(
                                            allowNegative: false)
                                      ],
                                      keyboardType: TextInputType.number,
                                      validate: (value) {
                                        if (value!.isEmpty && isFinishedGood) {
                                          return 'Please enter the Quantity';
                                        }
                                        return null;
                                      },
                                    )),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: const BorderSide(
                                      width: 3,
                                      color: Colors
                                          .black, // Add a border to make it more visible
                                    ),
                                  ),
                                  activeColor: Colors
                                      .blue, // Customize the checkbox's color when checked
                                  checkColor: Colors
                                      .white, // Customize the check icon's color
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    // Customize the checkbox's color when unchecked
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Styles
                                          .primaryColor; // Make it semi-transparent when unchecked
                                    }
                                    return Colors.black;
                                  }),
                                  value: isDiscountAble,
                                  onChanged: (v) {
                                    setState(() {
                                      isDiscountAble = !isDiscountAble;
                                    });
                                  }),
                              // const Gap(5),
                              Text(
                                "Discount Able",
                                style: Styles.poppins14,
                              ),
                              const Gap(5),
                              if (isDiscountAble)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DesignedTextField(
                                      inputFormatters: [
                                        PercentageTextInputFormatter(
                                            decimalDigits: 2,
                                            decimalSeparator: '.'),
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: discount,
                                      labelText: 'Max Discount (%)',
                                      //keyboardType: TextInputType.number,
                                      validate: (value) {
                                        if (value!.isEmpty && isDiscountAble) {
                                          return 'Cannot be empty';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: const BorderSide(
                                      width: 3,
                                      color: Colors
                                          .black, // Add a border to make it more visible
                                    ),
                                  ),
                                  activeColor: Colors
                                      .blue, // Customize the checkbox's color when checked
                                  checkColor: Colors
                                      .white, // Customize the check icon's color
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    // Customize the checkbox's color when unchecked
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Styles
                                          .primaryColor; // Make it semi-transparent when unchecked
                                    }
                                    return Colors.black;
                                  }),
                                  value: isTaxGst,
                                  onChanged: (v) {
                                    setState(() {
                                      isTaxGst = !isTaxGst;
                                    });
                                  }),
                              // const Gap(5),
                              Text(
                                "Tax/GST",
                                style: Styles.poppins14,
                              ),
                              const Gap(5),
                              if (isTaxGst)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DesignedTextField(
                                      controller: taxGst,
                                      labelText: 'GST Tax percentge (%)',
                                      inputFormatters: [
                                        PercentageTextInputFormatter(
                                            decimalDigits: 2,
                                            decimalSeparator: '.'),
                                      ],
                                      keyboardType: TextInputType.number,
                                      validate: (value) {
                                        if (value!.isEmpty && isTaxGst) {
                                          return 'Cannot be empty';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                )
                            ],
                          ),
                          if (isTaxGst)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "CESS :",
                                  style: Styles.poppins14,
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DesignedTextField(
                                      inputFormatters: [
                                        PercentageTextInputFormatter(
                                            decimalDigits: 2,
                                            decimalSeparator: '.'),
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: cess,
                                      labelText: ' CESS On GST(%)',
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Can not be empty';
                                        }
                                        return null;
                                      },
                                      //  keyboardType: TextInputType.number,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          if (isTaxGst)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Is that tax ?",
                                  style: Styles.poppins14,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          side: const BorderSide(
                                            width: 3,
                                            color: Colors
                                                .black, // Add a border to make it more visible
                                          ),
                                        ),
                                        activeColor: Colors
                                            .blue, // Customize the checkbox's color when checked
                                        checkColor: Colors
                                            .white, // Customize the check icon's color
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                          // Customize the checkbox's color when unchecked
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return Styles
                                                .primaryColor; // Make it semi-transparent when unchecked
                                          }
                                          return Colors.black;
                                        }),
                                        value: !isInclusive,
                                        onChanged: (v) {
                                          setState(() {
                                            isInclusive = !isInclusive;
                                          });
                                        }),
                                    // const Gap(5),
                                    Text(
                                      "Exclusive",
                                      style: Styles.poppins14,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          side: const BorderSide(
                                            width: 3,
                                            color: Colors
                                                .black, // Add a border to make it more visible
                                          ),
                                        ),
                                        activeColor: Colors
                                            .blue, // Customize the checkbox's color when checked
                                        checkColor: Colors
                                            .white, // Customize the check icon's color
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                          // Customize the checkbox's color when unchecked
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return Styles
                                                .primaryColor; // Make it semi-transparent when unchecked
                                          }
                                          return Colors.black;
                                        }),
                                        value: isInclusive,
                                        onChanged: (v) {
                                          setState(() {
                                            isInclusive = !isInclusive;
                                          });
                                        }),
                                    // const Gap(5),
                                    Text(
                                      "Inclusive",
                                      style: Styles.poppins14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: const BorderSide(
                                      width: 3,
                                      color: Colors
                                          .black, // Add a border to make it more visible
                                    ),
                                  ),
                                  activeColor: Colors
                                      .blue, // Customize the checkbox's color when checked
                                  checkColor: Colors
                                      .white, // Customize the check icon's color
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    // Customize the checkbox's color when unchecked
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Styles
                                          .primaryColor; // Make it semi-transparent when unchecked
                                    }
                                    return Colors.black;
                                  }),
                                  value: isAltName,
                                  onChanged: (v) {
                                    setState(() {
                                      isAltName = !isAltName;
                                    });
                                  }),
                              // const Gap(5),
                              Text(
                                "Alternate Name ",
                                style: Styles.poppins14,
                              ),
                              const Gap(5),
                              if (isAltName)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DesignedTextField(
                                      controller: altName,
                                      labelText: 'Enter Alternate Name',
                                      validate: (value) {
                                        if (value!.isEmpty && isAltName) {
                                          return 'Can not be empty';
                                        }
                                        return null;
                                      },
                                      //  keyboardType: TextInputType.number,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                      const Gap(15),

                      InkWell(
                        onTap: () {
                          showAnimatedDialog(
                              barrierDismissible: false,
                              context: context,
                              animationType:
                                  DialogTransitionType.slideFromBottomFade,
                              builder: (context) {
                                TextEditingController varname =
                                    TextEditingController();
                                TextEditingController varrate =
                                    TextEditingController();

                                return AlertDialog(
                                  content: Form(
                                    key: _variationformKey,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Enter variation Details",
                                                style: Styles.poppins14,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.cancel,
                                                    color: Styles.primaryColor,
                                                  ))
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: varname,
                                              //initialValue: serialNumber.toString(),

                                              decoration: InputDecoration(
                                                //errorBorder: const InputBorder(),

                                                errorStyle: Styles.poppins16w400
                                                    .copyWith(
                                                        color: Colors.red),
                                                labelText: 'Variation name',
                                                labelStyle:
                                                    Styles.poppins16w400,
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style: const TextStyle(
                                                  fontSize: 16.0),
                                              // onChanged: (v){

                                              // },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter variant name';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                // _menuItem.name = value!;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              inputFormatters: [
                                                NumberTextInputFormatter(
                                                    allowNegative: false)
                                              ],
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: varrate,
                                              //initialValue: serialNumber.toString(),

                                              decoration: InputDecoration(
                                                //errorBorder: const InputBorder(),

                                                errorStyle: Styles.poppins16w400
                                                    .copyWith(
                                                        color: Colors.red),
                                                labelText: 'Rate',
                                                labelStyle:
                                                    Styles.poppins16w400,
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style: const TextStyle(
                                                  fontSize: 16.0),
                                              // onChanged: (v){

                                              // },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter price';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                // _menuItem.name = value!;
                                              },
                                            ),
                                          ),
                                          CustomButton(
                                              onTap: () {
                                                // _variationformKey.currentState.validate();
                                                if (_variationformKey
                                                    .currentState!
                                                    .validate()) {
                                                  _formKey.currentState!.save();
                                                  Variations.add(ItemVariation(
                                                    variationName: varname.text,
                                                    rate: varrate.text,
                                                  ));
                                                  Navigator.pop(context);
                                                }
                                              },
                                              height: 60,
                                              buttonText: "Save")
                                        ]),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 181, 187, 255),
                            borderRadius: Styles.myradius2,

                            //boxShadow: Styles.myShadow
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            child: Text(
                              "+ Add Variations",
                              style: Styles.poppins14.copyWith(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      if (Variations.isNotEmpty)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Variations :",
                                style: Styles.poppins16w400,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: Styles.myradius2),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Name",
                                      style: Styles.poppins16w400,
                                    ),
                                    const Gap(5),
                                    Text(
                                      "Rate",
                                      style: Styles.poppins16w400,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: List.generate(
                              Variations.length,
                              (index) => Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: Styles.myradius2),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${Variations[index].variationName}",
                                          style: Styles.poppins16w400,
                                        ),
                                        const Gap(5),
                                        Text(
                                          "${Variations[index].rate}",
                                          style: Styles.poppins16w400,
                                        ),
                                        const Gap(5),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                Variations.removeAt(index);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Styles.primaryColor,
                                            ))
                                      ],
                                    ),
                                  )),
                        ),
                      ),
                      //Variations.map((e) => null)
                      const Gap(20),
                      ElevatedButton(
                        onPressed: () {
                          if (selectedDepartment == null ||
                              selectedCategory == null ||
                              selectedType == null) {
                            setState(() {
                              y = Text(
                                " Not Selected",
                                style: Styles.poppins14
                                    .copyWith(color: Colors.red),
                              );
                            });
                          }
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (selectedDepartment == null ||
                                selectedCategory == null ||
                                selectedType == null) {
                              setState(() {
                                y = Text(
                                  " Not Selected",
                                  style: Styles.poppins14
                                      .copyWith(color: Colors.red),
                                );
                              });
                            } else {
                              Get.find<StorageController>()
                                  .addNewItemInventory(Item.fromjson({
                                "autoNum":
                                    inventoryController.assignNewAutoNum(),
                                "autoCode": itemCode.text.trim(),
                                "shortName": itemCode.text.toString(),
                                "itemname": name.text,
                                "rate": rate.text,
                                "department": selectedDepartment,
                                "tax": taxGst.text,
                                "inclusiveOrExclusive": taxGst.text.isNotEmpty
                                    ? isInclusive
                                        ? isInclusive
                                        : !isInclusive
                                    : null,
                                if (isTaxGst) "cess": cess.text,
                                "discountable": isDiscountAble,
                                "discount": discount.text,
                                "discontinued": false,
                                "isFinishedGood": isFinishedGood,
                                "qty": isFinishedGood ? qtx.text : 0,
                                "sellUom": unit.text,
                                "altName": altName.text,
                                "category": selectedCategory,
                                "type": selectedType,
                                "isRateDeciaml": isRateDeciaml,
                                if (Variations.isNotEmpty)
                                  "variations":
                                      Variations.map((e) => e.tojson()).toList()
                              }));
                            }
                            Future.delayed(const Duration(seconds: 1))
                                .whenComplete(() {
                              reset();
                            });
                          }
                        },
                        style: Styles.mybuttonStyle,
                        child: Text(
                          'Add Item',
                          style: Styles.poppins16w500
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

           
            ],
          ),
        );
        Widget recentAdded = inventoryController.recentlyAddedItems.isEmpty
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recenty Added Items",
                      style: Styles.poppins14
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const Gap(5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: inventoryController.recentlyAddedItems.reversed
                          .toList()
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  // height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: Styles.myShadow,
                                      borderRadius: Styles.myradius2),
                                  child:
                                      // mainAxisSize: MainAxisSize.min,

                                      Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              e.itemname.toString(),
                                              style: Styles.poppins14,
                                            ),
                                            Text(
                                              "Rs${e.rate.toString()}/${e.sellUom.toString()}",
                                              style: Styles.poppins14,
                                            ),
                                          ],
                                        ),
                                        if (e.variations != null)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: e.variations!
                                                  .map((e1) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(e1
                                                                .variationName
                                                                .toString()),
                                                            Text(
                                                                "Rs.${e1.rate}")
                                                          ],
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              );
        return ResponsiveHelper.isMobile(context) ||
                inventoryController.recentlyAddedItems.isEmpty
            ? form
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: form),
                  Expanded(flex: 2, child: recentAdded)
                ],
              );
      }),
    );
  }
}
