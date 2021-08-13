import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/src/user.dart';
import 'package:meta/meta.dart';
import 'user_old.dart';
import 'util.dart';

/// All possible room types
enum RoomType { channel, direct, group, unsupported }

/// Extension with one [toShortString] method
extension RoomTypeToShortString on RoomType {
  /// Converts enum to the string equal to enum's naam
  String toShortString() {
    return toString().split('.').last;
  }
}

/// A class that represents a room where 2 or more participants can chat
@immutable
class Room extends Equatable {
  /// Creates a [Room]
  const Room({
    this.aangemaaktOp,
    required this.id,
    this.fotoUrl,
    this.metadata,
    this.naam,
    required this.type,
    required this.gebruikers,
  });

  /// Creates room from a map (decoded JSON).
  Room.fromJson(Map<String, dynamic> json)
      : aangemaaktOp = json['aangemaaktOp'] as DateTime?,
        id = json['id'] as String,
        fotoUrl = json['fotoUrl'] as String?,
        metadata = json['metadata'] as Map<String, dynamic>?,
        naam = json['naam'] as String?,
        type = getRoomTypeFromString(json['type'] as String),
        gebruikers = (json['gebruikers'] as List<Map<String, dynamic>>)
            .map((e) => User.fromJson(e))
            .toList();

  /// Converts room to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => {
        'aangemaaktOp': aangemaaktOp,
        'id': id,
        'fotoUrl': fotoUrl,
        'metadata': metadata,
        'naam': naam,
        'type': type.toShortString(),
        'gebruikers': gebruikers.map((e) => e.toJson()).toList(),
      };

  /// Creates a copy of the room with an updated data.
  /// [fotoUrl] and [naam] with null values will nullify existing values
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  /// [type] and [gebruikers] with null values will be overwritten by previous values.
  Room copyWith({
    String? fotoUrl,
    Map<String, dynamic>? metadata,
    String? naam,
    RoomType? type,
    List<User>? gebruikers,
  }) {
    return Room(
      id: id,
      fotoUrl: fotoUrl,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      naam: naam,
      type: type ?? this.type,
      gebruikers: gebruikers ?? this.gebruikers,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props =>
      [aangemaaktOp, id, fotoUrl, metadata, naam, type, gebruikers];

  /// Created room timestamp, in ms
  final DateTime? aangemaaktOp;

  /// Room's unique ID
  final String id;

  /// Room's foto. In case of the [RoomType.direct] - avatar of the second person,
  /// otherwise a custom foto [RoomType.group].
  final String? fotoUrl;

  /// [RoomType]
  final RoomType type;

  /// Additional custom metadata or attributes related to the room
  final Map<String, dynamic>? metadata;

  /// Room's naam. In case of the [RoomType.direct] - naam of the second person,
  /// otherwise a custom naam [RoomType.group].
  final String? naam;

  /// List of gebruikers which are in the room
  final List<User> gebruikers;
}
