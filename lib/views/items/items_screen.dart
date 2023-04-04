import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  // Initial Selected Value
  String dropdownvalue = '10';

  // List of items in our dropdown menu
  var items = [
    '10',
    '25',
    '50',
    '100',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: REdgeInsets.all(30),
        child: Column(children: [
          Padding(
            padding: REdgeInsets.only(bottom: 30),
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: REdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest sales (max. 5)',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Row(
                          children: [
                            OutlinedButton(
                                onPressed: () {}, child: Text('Export CSV')),
                            SizedBox(
                              width: 15.w,
                            ),
                            OutlinedButton(
                                onPressed: () {}, child: Text('New item'))
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                      padding: REdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Show',
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  DropdownButton(
                                    // Initial Value
                                    value: dropdownvalue,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    'entries',
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Search',
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Container(
                                    width: 100.w,
                                    child: const TextField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueGrey),
                                        ),
                                        hintText: 'Search',
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          DataTable(
                              columnSpacing: 200.w,
                              dataTextStyle: TextStyle(
                                  fontSize: 16.sp, color: Colors.black54),
                              headingRowColor: const MaterialStatePropertyAll(
                                  Colors.blueGrey),
                              headingTextStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'Created at',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Reference',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Supplier',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Grand total',
                                  ),
                                ),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(Text('2023-04-03 00:33:52')),
                                    DataCell(Text('REF-00579')),
                                    DataCell(Text('3')),
                                    DataCell(Text('\$ 0.00')),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Text('2023-04-03 00:33:52')),
                                    DataCell(Text('REF-00579')),
                                    DataCell(Text('3')),
                                    DataCell(Text('\$ 0.00')),
                                  ],
                                )
                              ]),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
