import 'package:paystack_manager/models/transaction_status.dart';

class APIResponse {
  bool status;
  String statusMessage;
  dynamic data;
  String reference;
  String dataMessage;
  TransactionState nextAction;
  String displayText;
  String? gatewayResponse;
  String authUrl;

  APIResponse({
    required this.status,
    required this.statusMessage,
    this.data,
    required this.reference,
    required this.dataMessage,
    this.gatewayResponse,
    required this.nextAction,
    required this.displayText,
    required this.authUrl,
  });

  factory APIResponse.fromObject(dynamic object) {
    TransactionState mNextAction = TransactionState.PENDING;

    switch (object["data"]["status"]) {
      case "pending":
        mNextAction = TransactionState.PENDING;
        break;
      case "failed":
        mNextAction = TransactionState.FAILED;
        break;
      case "success":
        mNextAction = TransactionState.SUCCESS;
        break;
      case "send_otp":
        mNextAction = TransactionState.SEND_OTP;
        break;
      case "send_pin":
        mNextAction = TransactionState.SEND_PIN;
        break;
      case "send_phone":
        mNextAction = TransactionState.SEND_PHONE;
        break;
      case "send_birthday":
        mNextAction = TransactionState.SEND_BIRTHDATE;
        break;
      case "pay_offline":
        mNextAction = TransactionState.PAY_OFFLINE;
        break;
      case "send_address":
        mNextAction = TransactionState.SEND_ADDRESS;
        break;
      case "open_url":
        mNextAction = TransactionState.SEND_AUTH_URL;
        break;
      case "ongoing":
        mNextAction = TransactionState.FAILED;
        break;
      default:
        mNextAction = TransactionState.PENDING;
        break;
    }

    return APIResponse(
      statusMessage: object["message"],
      status: object["status"],
      data: object["data"],
      reference: object["data"]["reference"],
      dataMessage: object["data"]["message"] ?? "",
      displayText: object["data"]["display_text"] ?? "",
      gatewayResponse: object["data"]["gateway_response"] ?? "",
      authUrl: object["data"]["url"] ?? "",
      nextAction: mNextAction,
    );
  }
}
