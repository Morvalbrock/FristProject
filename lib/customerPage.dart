import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'custom.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'demo_bottombar_icons.dart';
import 'package:http/http.dart';
import 'customerProfile.dart';

List<OrderInfo> _employees = <OrderInfo>[];
List<OrderInfo> res = [];
late EmployeeDataSource _employeeDataSource;

class CustomPage extends StatefulWidget {
  const CustomPage({super.key});

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  final GlobalKey<ScaffoldState> _scaffoldKeys = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeys1 = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    getInfo();
    _employees = getSearchDetails();
    _employeeDataSource = EmployeeDataSource(employees: _employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeys,
      appBar: CustomAppBar(_scaffoldKeys1, 'CustomerPage'),
      drawer: CustomDrawer(context),
      backgroundColor: HexColor('ECEEF9'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                  decoration: BoxDecoration(color: Color(0xFFF1F4FF)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'CUSTOMERS',
                            style: TextStyle(
                              color: Color(0xFF3C3C3C),
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.05,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.30,
                            height: 34.0,
                            child: GFButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  'addcustomer',
                                );
                              },
                              text: "Add Customer",
                              textStyle: TextStyle(
                                fontSize: 16.0,
                                color: HexColor('183BB7'),
                              ),
                              color: HexColor('183BB7'),
                              type: GFButtonType.outline,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: SizedBox(
                              height: 44.0,
                              child: TextField(
                                onChanged: (value) async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  if (value != '' || value != null) {
                                    Response response = await post(
                                        Uri.parse(
                                            'https://searchsoft.in/cable/api/search/' +
                                                value.toString()),
                                        body: {
                                          'id': prefs.getInt('id').toString(),
                                          'comp_id': prefs
                                              .getInt('comp_id')
                                              .toString(),
                                        });
                                    var resp = jsonDecode(response.body);
                                    res.clear();
                                    for (var item in resp['data']) {
                                      OrderInfo lst = OrderInfo(
                                        item['id'],
                                        item['name'],
                                        item['mobile'],
                                      );
                                      res.add(lst);
                                    }
                                    setState(() {
                                      _employees = getSearchDetails();
                                      _employeeDataSource = EmployeeDataSource(
                                          employees: _employees);
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10.0),
                                  hintText: "Search here",
                                  suffixIcon: Icon(Icons.search, size: 20),
                                  hintStyle: TextStyle(
                                    color: Color(0xFF929292),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.01,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFC4C4C4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //     border:
                        //         Border(right: BorderSide(color: Colors.black12))),
                        height: MediaQuery.of(context).size.height * 0.60,
                        child: SfDataGridTheme(
                          data: SfDataGridThemeData(
                              headerColor: const Color(0xFFA3BCFF)),
                          child: SfDataGrid(
                            onCellTap: (DataGridCellTapDetails details) {
                              var id = _employeeDataSource.effectiveRows[
                                      details.rowColumnIndex.rowIndex - 1]
                                  .getCells()[
                                      details.rowColumnIndex.columnIndex = 0]
                                  .value;
                              // Navigator.pushNamed(context, 'customerprofile');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CustomerProfile(cusid: id),
                                ),
                              );
                            },
                            navigationMode: GridNavigationMode.row,
                            allowPullToRefresh: true,
                            source: _employeeDataSource,
                            columnWidthMode: ColumnWidthMode.fill,
                            gridLinesVisibility: GridLinesVisibility.none,
                            rowHeight: 35.0,
                            headerRowHeight: 40.0,
                            // rowsPerPage: 13,
                            columnWidthCalculationRange:
                                ColumnWidthCalculationRange.allRows,
                            // headerGridLinesVisibility: GridLinesVisibility.vertical,
                            columns: [
                              GridColumn(
                                  columnName: 'id',
                                  maximumWidth: 50.0,
                                  label: Container(
                                      padding: EdgeInsets.only(
                                          left: 3.0, right: 0.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'S.No.',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16.0),
                                      ))),
                              GridColumn(
                                  columnName: 'name',
                                  // maximumWidth: 100.0,
                                  label: Container(
                                      padding: EdgeInsets.only(
                                          left: 5.0, right: 5.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Name',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16.0),
                                      ))),
                              GridColumn(
                                  columnName: 'Mobile_no',
                                  // maximumWidth: 100.0,
                                  label: Container(
                                      padding: EdgeInsets.only(
                                          left: 5.0, right: 0.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Mobile No',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16.0),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(context, 1),
    );
  }
}

class OrderInfo {
  OrderInfo(
    this.id,
    this.name,
    this.mobile,
  );

  final int? id;
  final String? name;
  final String? mobile;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<OrderInfo> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'Id', value: dataGridRow.id),
              DataGridCell<String>(columnName: 'Name', value: dataGridRow.name),
              DataGridCell<String>(
                  columnName: 'Mobile_no', value: dataGridRow.mobile),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        // color: Colors.red,
        cells: row.getCells().map<Widget>((e) {
      return Padding(
        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
        child: Container(
          // margin: EdgeInsets.only(top: 10.0, bottom: 2.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x21000000),
                blurRadius: 36,
                offset: Offset(4, 8),
                spreadRadius: 0,
              )
            ],
          ),
          padding: EdgeInsets.all(8.0),
          child: Text(
            e.value.toString(),
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      );
    }).toList());
  }
}

Future<List<OrderInfo>> getInfo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response =
      await post(Uri.parse('https://searchsoft.in/cable/api/search'), body: {
    'id': prefs.getInt('id').toString(),
    'comp_id': prefs.getInt('comp_id').toString(),
  });
  var resp = jsonDecode(response.body);
  // List<OrderInfo> res = [];
  res.clear();
  for (var item in resp['data']) {
    OrderInfo lst = OrderInfo(
      item['id'],
      item['name'],
      item['mobile'],
    );
    res.add(lst);
  }
  // res = resp['data'].toList();
  // res = response.body;
  // print(res);
  return res;
  // print(res);
}

List<OrderInfo> getSearchDetails() {
  List<OrderInfo> orderDetails = res;
  return orderDetails;
}
