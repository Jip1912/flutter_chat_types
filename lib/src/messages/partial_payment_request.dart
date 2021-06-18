import 'package:meta/meta.dart';
import 'text_message.dart';

/// A class that represents partial text message.
@immutable
class PartialPaymentRequest {
  /// Creates a partial text message with all variables text can have.
  /// Use [TextMessage] to create a full message.
  /// You can use [TextMessage.fromPartial] constructor to create a full
  /// message from a partial one.
  const PartialPaymentRequest ({
    required this.amount,
    required this.paymentStatus
  });

  /// Creates a partial text message from a map (decoded JSON).
  PartialPaymentRequest.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as double,
        paymentStatus = json['paymentStatus'] as String;

  /// Converts a partial text message to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => {
        'amount': amount,
        'paymentStatus': paymentStatus
      };

  /// User's message
  final double amount;
  final String paymentStatus;
}
