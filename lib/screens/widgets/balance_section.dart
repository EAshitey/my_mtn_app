import 'package:flutter/material.dart';
import 'package:my_mtn_app/helpers/helpers_export.dart';
import 'package:my_mtn_app/shared/color_constants.dart';

import 'reusable_widgets.dart';

enum BalanceType { airtime, data, broadband, sms }

// map the quick access type to the corresponding string value
extension BalanceTypeExtension on BalanceType {
  IconData get icon {
    switch (this) {
      case BalanceType.airtime:
        return Icons.phone_in_talk_rounded;

      case BalanceType.data:
        return Icons.data_usage_outlined;

      case BalanceType.broadband:
        return Icons.wifi_rounded;

      case BalanceType.sms:
        return Icons.email_outlined;
      default:
        return Icons.no_encryption;
    }
  }

  String get name {
    switch (this) {
      case BalanceType.airtime:
        return 'AIRTIME';
      case BalanceType.data:
        return 'DATA';
      case BalanceType.broadband:
        return 'BROADBAND';
      case BalanceType.sms:
        return 'SMS';
      default:
        return '';
    }
  }
}

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainSpaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Balances',
                  style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                3.width,
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.refresh,
                    size: 18.h,
                  ),
                ),
              ],
            ),
            buildViewAllBtn(),
          ],
        ),
        15.height,
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.6,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            buildBalanceCard(
              balanceType: BalanceType.airtime,
              amount: 'GHS 0.00',
            ),
            buildBalanceCard(
              balanceType: BalanceType.data,
              amount: '0.00 GB',
            ),
            buildBalanceCard(
              balanceType: BalanceType.sms,
              amount: '0.00 SMS',
            ),
            buildBalanceCard(
              balanceType: BalanceType.broadband,
              amount: 'GET CONNECTED',
            ),
          ],
        ),
      ],
    );
  }

  buildBalanceCard({
    required BalanceType balanceType,
    required String amount,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.w,
        left: 2.w,
        right: 2.w,
        bottom: 2.h,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.kprimary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: mainSpaceBetween,
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Icon(
                  balanceType.icon,
                  size: 15.h,
                ),
                5.width,
                Text(
                  balanceType.name,
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            decoration: const BoxDecoration(
                color: ColorConstants.kbackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )),
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    fontSize:
                        balanceType == BalanceType.broadband ? 15.h : 18.h,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Divider(color: Colors.grey.withOpacity(0.2)),
                if (balanceType == BalanceType.broadband) ...[
                  Text(
                    "CLICK HERE",
                    style: TextStyle(
                      fontSize: 12.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ] else
                  Text(
                    "BONUS :",
                    style: TextStyle(
                      fontSize: 12.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
