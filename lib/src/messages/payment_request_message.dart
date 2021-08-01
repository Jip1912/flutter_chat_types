import 'package:flutter_chat_types/src/messages/partial_payment_request.dart';
import 'package:meta/meta.dart';
import '../message.dart';
import '../preview_data.dart' show PreviewData;
import '../user.dart';
import '../user_old.dart' show User;
import '../util.dart' show getStatusFromString;
import 'partial_text.dart';

/// A class that represents text message.
@immutable
class PaymentRequestMessage extends Message {
  /// Creates a text message.
  PaymentRequestMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    this.previewData,
    String? roomId,
    Status? status,
    required this.amount,
    required this.paymentStatus,
    required this.paymentUrl,
    required this.paymentId

  }) : super(
          author,
          createdAt,
          id,
          metadata,
          roomId,
          status,
          MessageType.paymentRequest,
        );

  /// Creates a full text message from a partial one.
  PaymentRequestMessage.fromPartial({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    required PartialPaymentRequest partialPaymentRequest,
    String? roomId,
    Status? status,
  })  : previewData = null,
        amount = partialPaymentRequest.amount,
        paymentStatus = partialPaymentRequest.paymentStatus,
        paymentUrl = partialPaymentRequest.paymentUrl,
        paymentId = partialPaymentRequest.paymentId,
        super(
          author,
          createdAt,
          id,
          metadata,
          roomId,
          status,
          MessageType.paymentRequest,
        );

  /// Creates a text message from a map (decoded JSON).
  PaymentRequestMessage.fromJson(Map<String, dynamic> json)
      : previewData = json['previewData'] == null
            ? null
            : PreviewData.fromJson(json['previewData'] as Map<String, dynamic>),
        amount = json['amount'] as double,
        paymentStatus = json['paymentStatus'] as String,
        paymentUrl = json['paymentUrl'] as String,
        paymentId = json['paymentId'] as String,
        super(
          User.fromJson(json['author'] as Map<String, dynamic>),
          json['createdAt'] as int?,
          json['id'] as String,
          json['metadata'] as Map<String, dynamic>?,
          json['roomId'] as String?,
          getStatusFromString(json['status'] as String?),
          MessageType.paymentRequest,
        );

  /// Converts a text message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => {
        'author': author.toJson(),
        'createdAt': createdAt,
        'id': id,
        'metadata': metadata,
        'previewData': previewData?.toJson(),
        'roomId': roomId,
        'status': status?.toShortString(),
        'amount': amount,
        'paymentStatus': paymentStatus,
        'paymentUrl': paymentUrl,
        'paymentId': paymentId,
        'type': MessageType.paymentRequest.toShortString(),
      };

  /// Creates a copy of the text message with an updated data
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  /// [status] with null value will be overwritten by the previous status.
  @override
  Message copyWith({
    Map<String, dynamic>? metadata,
    PreviewData? previewData,
    Status? status,
    double? amount,
    String? paymentStatus,
    String? paymentUrl,
    String? paymentId,
    String? text,
  }) {
    return PaymentRequestMessage(
      author: author,
      createdAt: createdAt,
      id: id,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      previewData: previewData,
      roomId: roomId,
      status: status ?? this.status,
      amount: amount ?? this.amount,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      paymentId: paymentId ?? this.paymentId
    );
  }

  /// Equatable props
  @override
  List<Object?> get props =>
      [author, createdAt, id, metadata, previewData, roomId, status, amount, paymentStatus, paymentUrl, paymentId];

  /// See [PreviewData]
  final PreviewData? previewData;

  /// User's message
  final double amount;
  String paymentStatus;
  final String paymentUrl;
  final String paymentId;
}
