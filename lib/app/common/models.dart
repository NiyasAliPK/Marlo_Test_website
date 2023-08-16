class TransactionCardDataModel {
  final int amount;
  final String currency;
  final String TranscationType;

  TransactionCardDataModel(
      {required this.amount,
      required this.currency,
      required this.TranscationType});
}

class TransactionsResponseModel {
  String? httpStatusCode;
  Response? response;

  TransactionsResponseModel({
    this.httpStatusCode,
    this.response,
  });

  factory TransactionsResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionsResponseModel(
        httpStatusCode: json["http_status_code"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );
}

class Response {
  String? errorFlag;
  String? message;
  List<Transaction>? data;

  Response({
    this.errorFlag,
    this.message,
    this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        errorFlag: json["error_flag"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Transaction>.from(
                json["data"]!.map(
                    (x) => Transaction.fromJson(Map<String, dynamic>.from(x))),
              ),
      );
}

class Transaction {
  final String? id;
  final String? amount;
  final String? status;
  final String? sourceId;
  final String? sourceType;
  final String? transactionType;
  final String? currency;
  final String? createdAt;
  final String? fee;
  final String? description;
  final String? settledAt;
  final String? estimatedSettledAt;
  final String? currency1;

  Transaction({
    required this.id,
    required this.amount,
    required this.status,
    required this.sourceId,
    required this.sourceType,
    required this.transactionType,
    required this.currency,
    required this.createdAt,
    required this.fee,
    required this.description,
    required this.settledAt,
    required this.estimatedSettledAt,
    required this.currency1,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      amount: json['amount'],
      status: json['status'],
      sourceId: json['sourceId'],
      sourceType: json['sourceType'],
      transactionType: json['transactionType'],
      currency: json['currency'],
      createdAt: json['createdAt'],
      fee: json['fee'],
      description: json['description'],
      settledAt: json['settledAt'],
      estimatedSettledAt: json['estimatedSettledAt'],
      currency1: json['currency1'],
    );
  }
}
