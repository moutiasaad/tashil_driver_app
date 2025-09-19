import 'package:delivery_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/shared/language/extension.dart';

import 'package:provider/provider.dart';

import '../../../providers/register_provider.dart';
import '../../../shared/components/text/verification_time_text.dart';

import '../../models/register_model.dart';
import '../../shared/components/text/CText.dart';
import '../../shared/components/text_fields/verification_field.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/colors.dart';

class SecondLoginScreen extends StatefulWidget {
  const SecondLoginScreen(
      {super.key,
      required this.data,
      required this.forword,
      required this.back});

  final RegisterModel data;
  final Function forword;
  final Function back;

  @override
  State<SecondLoginScreen> createState() => _SecondLoginScreenState();
}

class _SecondLoginScreenState extends State<SecondLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      backgroundColor: BackgroundColor.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppImages.otpIcon,
                  width: 140, height: 140, fit: BoxFit.cover),
              cText(
                  text: context.translate('login.checkNumber'),
                  style: AppTextStyle.boldPrimary22,
                  pBottom: 5),
              cText(
                  text: '${context.translate('login.codeSendIt')}',
                  style: AppTextStyle.regularBlack1_16,
                  pBottom: 10),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  widget.back();
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: BackgroundColor.grey1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, color: IconColors.black, size: 20),
                      cText(
                        text: widget.data.email,
                        style: AppTextStyle.regularBlack1_16,
                      ),
                    ],
                  ),
                ),
              ),
              VerificationField(
                forword: widget.forword,
                clear: () {
                  registerProvider.otpError = false;
                },
                //code: 123456,
                secondsRemaining: 60,
                data: widget.data,
              ),
              SizedBox(
                height: 20,
              ),
              CountdownTimer(
                done: () {},
                secondsRemaining: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
