import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/shared/language/extension.dart';

import '../models/create_design_model.dart';
import '../models/enum/order_status.dart';
import '../models/order_model.dart';
import '../models/static_model/filter_types.dart';
import '../models/static_model/static_cart_model.dart';
import '../models/transaction_model.dart';
import '../shared/local/cash_helper.dart';
import '../shared/logique_function/date_functions.dart';
import '../shared/remote/dio_helper.dart';
import '../shared/snack_bar/snack_bar.dart';

class WalletProvider extends ChangeNotifier {
  bool loading = false;

  Future<TransactionModel> getTransactions() async {
    try {
      final response = await DioHelper.getData(url: 'drivers/transactions');

      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        TransactionModel result = TransactionModel.fromJson(data);

        if (data.isEmpty) {
          return Future.error('Failed to load data');
        }
        return result;
      } else {
        return Future.error('Failed to load data');
      }
    } catch (error) {
      print(error);
      if (error is DioException &&
          (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.connectionError)) {
        return await Future.error('connection timeout');
      } else if (error is DioException) {
        return await Future.error('connection other');
      } else {
        return await Future.error('connection other');
      }
    }
  }

  Future<void> withdraw(BuildContext context, double amount) async {
    loading = true;
    notifyListeners();

    try {
      final response = await DioHelper.postData(
          url: 'drivers/withdraw', data: {"amount": amount});
      if (response.data['message'] == "Withdrawal successful") {
        loading = false;
        notifyListeners();
        Navigator.pop(context);
        ShowSuccesSnackBar(
            context, context.translate('successMessage.withdraw'));
      }
      else{
        loading = false;
        notifyListeners();
        Navigator.pop(context);
        ShowErrorSnackBar(context, context.translate('errorsMessage.withdraw'));
      }
    } catch (error) {
      print('zqs');
      print(error);
      if (error is DioException &&
          (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.connectionError)) {
        loading = false;
        notifyListeners();
        Navigator.pop(context);
        ShowErrorSnackBar(
            context, context.translate('errorsMessage.connection'));
        return Future.error('connection timeout');
      } else if (error is DioException) {
        loading = false;
        notifyListeners();
        Navigator.pop(context);
        ShowErrorSnackBar(context, context.translate('errorsMessage.withdraw'));
        return Future.error('connection $error');
      } else {
        loading = false;
        notifyListeners();
        return Future.error('connection other');
      }
    }
  }
}
