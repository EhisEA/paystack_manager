import 'package:paystack_manager/models/transaction_status.dart';
import 'api_response.dart';

class Transaction {
  String message;
  String refrenceNumber;
  TransactionState state;

  Transaction({
    required this.message,
    required this.refrenceNumber,
    required this.state,
  });

  factory Transaction.fromObject(APIResponse apiResponse) => Transaction(
        message: apiResponse.gatewayResponse ?? apiResponse.dataMessage,
        refrenceNumber: apiResponse.reference,
        state: apiResponse.nextAction,
      );
}
