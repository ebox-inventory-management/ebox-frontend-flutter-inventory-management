import 'package:ebox_frontend_web_inventory/views/items/new_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: REdgeInsets.all(30),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
              hintText: 'Search',
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
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
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) => Dialog(
                                            child: NewItemScreen(),
                                          )));
                                },
                                child: Text('New item'))
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
                          SizedBox(
                            height: 15.h,
                          ),
                          DataTable(
                              columnSpacing: 150.w,
                              dataTextStyle: TextStyle(
                                  fontSize: 16.sp, color: Colors.black54),
                              headingRowColor:
                                  const MaterialStatePropertyAll(Colors.orange),
                              headingTextStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'Name',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Code',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Brand',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Category',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Price',
                                  ),
                                ),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(Text('2023-04-03 00:33:52')),
                                    DataCell(Text('REF-00579')),
                                    DataCell(Text('3')),
                                    DataCell(Text('3')),
                                    DataCell(Text('\$ 0.00')),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Text('2023-04-03 00:33:52')),
                                    DataCell(Text('REF-00579')),
                                    DataCell(Text('3')),
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
