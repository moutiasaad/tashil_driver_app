import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery_app/models/order_model.dart';
import 'package:delivery_app/shared/language/extension.dart';
import 'package:delivery_app/shared/logique_function/time_function.dart';
import 'package:delivery_app/view/orders/order_detail.dart';

import '../../../models/enum/order_status.dart';
import '../../../shared/components/buttons/default_button.dart';
import '../../../shared/components/buttons/default_outlined_button.dart';
import '../../../shared/components/image/image_net.dart';
import '../../../shared/components/image/svg_icon.dart';
import '../../../shared/components/text/CText.dart';
import '../../../shared/logique_function/date_functions.dart';
import '../../../utils/app_dimens.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/colors.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, required this.order});

  final OrderModel order;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    //   decoration: BoxDecoration(
    //     color: BackgroundColor.background,
    //     borderRadius: BorderRadius.circular(10.0),
    //     border: Border.all(color: BorderColor.grey, width: 0.5),
    //   ),
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         spacing: 18,
    //         children: [
    //           Container(
    //             height: 45,
    //             width: 45,
    //             padding: EdgeInsets.all(8),
    //             decoration: BoxDecoration(
    //                 color: BackgroundColor.grey1, shape: BoxShape.circle),
    //             child: Center(
    //               child: SvgIcon(
    //                 icon: AppIcons.orderIcon,
    //                 height: 30,
    //                 width: 30,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               spacing: 0,
    //               children: [
    //                 cText(
    //                     text: widget.order.lines?.name ?? '',
    //                     style: AppTextStyle.semiBoldBlack14),
    //                 cText(
    //                     text: widget.order.address ?? '',
    //                     style: AppTextStyle.regularBlack1_14),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //       Container(
    //         margin: EdgeInsets.symmetric(vertical: 14),
    //         height: 1,
    //         width: double.infinity,
    //         color: BorderColor.grey1,
    //       ),
    //       Column(
    //         spacing: 12,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               cText(
    //                   text: context.translate('order.orderNumber'),
    //                   //convertToArabicDate(widget.order.createDate!),
    //                   style: AppTextStyle.regularBlack1_14),
    //               cText(
    //                   text: '#'+widget.order.lines!.driverOrderId.toString(),
    //                   //convertToArabicDate(widget.order.createDate!),
    //                   style: AppTextStyle.mediumBlack14),
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               cText(
    //                   text: context.translate('order.orderTime'),
    //                   //convertToArabicDate(widget.order.createDate!),
    //                   style: AppTextStyle.regularBlack1_14),
    //               cText(
    //                   text: getTimeFromDate(
    //                       widget.order.startDeliveryDate??'--'),
    //                   //convertToArabicDate(widget.order.createDate!),
    //                   style: AppTextStyle.mediumBlack14),
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               cText(
    //                   text: context.translate('order.orderDate'),
    //                   //convertToArabicDate(widget.order.createDate!),
    //                   style: AppTextStyle.regularBlack1_14),
    //               cText(
    //                   text:widget.order.startDeliveryDate != null? convertToArabicDate(
    //                       widget.order.startDeliveryDate!): '--',
    //                   style: AppTextStyle.mediumBlack14),
    //             ],
    //           ),
    //         ],
    //       ),
    //
    //       const SizedBox(height: 20),
    //
    //       DefaultOutlinedButton(
    //         raduis: 6,
    //
    //         text: context.translate('buttons.orderDetail'),
    //         textStyle: AppTextStyle.semiBoldPrimary14,
    //         leftIcon: Icon(Icons.arrow_forward,
    //         size: 20,
    //         color: IconColors.primary,),
    //
    //         pressed: () {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) =>
    //                    OrderDetail(data:widget.order)
    //               ));
    //         },
    //       ),
    //
    //       // SizedBox(
    //       //   height: 25,
    //       //   child: Row(
    //       //     children: [
    //       //       Expanded(
    //       //         child: DefaultButton(text:'تأكيد الطلب',
    //       //             textStyle: AppTextStyle.regularWhite12,
    //       //             pressed: (){
    //       //
    //       //             }, activated: true),
    //       //       ),
    //       //       SizedBox(width: 24,),
    //       //       Expanded(
    //       //         child: DefaultOutlinedButton(
    //       //             textStyle: AppTextStyle.regularSecondary12,
    //       //             text: 'تتبع الطلب',
    //       //             pressed: (){
    //       //
    //       //             }),
    //       //       )
    //       //
    //       //     ],
    //       //   ),
    //       // )
    //     ],
    //   ),
    // );
  }
}
