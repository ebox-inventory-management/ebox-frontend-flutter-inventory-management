import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/model/supplier.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_data_card.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;

import '../../../controller/controllers.dart';
import '../../../model/brand.dart';

class ProductDetail extends StatefulWidget {
  final Products product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey _qrKey = GlobalKey(); // Create a QR code image.
    QrImage? qrImage = QrImage(
      data: widget.product.product_url,
      version: QrVersions.auto,
      size: 200.w,
      embeddedImage: NetworkImage(widget.product.product_url),
    );

    Future<void> _downloadQrImage() async {
      final boundary =
          _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 1.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();
      final blob = html.Blob([pngBytes], 'image/png');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..download = '${widget.product.product_name}_qr.png';
      html.document.body!.append(anchor);
      anchor.click();
      html.Url.revokeObjectUrl(url);
    }

    return Center(
      child: Container(
        width: 0.9.sw,
        height: 0.9.sh,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(30.r),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Detail',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.sp),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.cancel,
                            size: 40.r,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
                    child: Divider(
                      color: Colors.black.withOpacity(0.1),
                      thickness: 5.w,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 450.w,
                            child: Text(
                              widget.product.product_name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30.sp),
                            ),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          SizedBox(
                              width: 0.4.sw,
                              child: ReadMoreText(
                                widget.product.description,
                                trimLines: 3,
                                colorClickableText: Colors.grey,
                                lessStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                                moreStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.grey),
                              )),
                          SizedBox(
                            height: 15.w,
                          ),
                          Text(
                            'Quantity: ${widget.product.product_quantity}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            'Unit: ${widget.product.unit}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            'Import Price: \$${widget.product.import_price}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            'Export Price: \$${widget.product.export_price}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            'Product amount: \$${widget.product.product_amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 30.w,
                          ),
                          RepaintBoundary(
                            key: _qrKey,
                            child: QrImage(
                              data: widget.product.product_url,
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: _downloadQrImage,
                            child: Container(
                              width: 200.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r))),
                              child: Center(
                                child: Text(
                                  'Download',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          ProductDataCard(
                              name: 'Product Code',
                              data: widget.product.product_code),
                          ProductDataCard(
                              name: 'Product Garage',
                              data: widget.product.product_garage),
                          ProductDataCard(
                              name: 'Product Route',
                              data: widget.product.product_route),
                          ProductDataCard(
                              name: 'Category',
                              data: categoryController.category.value!.name),
                          ProductDataCard(
                              name: 'Supplier',
                              data: supplierController.supplier.value!.name),
                          ProductDataCard(
                              name: 'Brand',
                              data: brandController.brand.value!.name),
                          SizedBox(
                            height: 30.w,
                          ),
                          Container(
                            width: 400.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: Center(
                              child: Text(
                                'Expire Date: ${widget.product.expire_date}',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 0.4.sw,
                            height: 0.4.sw,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.product.product_image),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 30.w,
                          ),
                          Container(
                            width: 0.4.sw,
                            height: 50.w,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: Center(
                              child: Text(
                                'Create Date: ${widget.product.created_at}',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Container(
                            width: 0.4.sw,
                            height: 50.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: Center(
                              child: Text(
                                'Update Date: ${widget.product.created_at}',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
