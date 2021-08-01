import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'util.dart' show getRoleFromString;

/// All possible roles UserOld can have.
enum Role { admin, agent, moderator, userold }

/// Extension with one [toShortString] method
extension RoleToShortString on Role {
  /// Converts enum to the string equal to enum's name
  String toShortString() {
    return toString().split('.').last;
  }
}

/// A class that represents UserOld.
@immutable
class UserOld extends Equatable {
  /// Creates a UserOld.
  const UserOld({
    this.createdAt,
    this.firstName,
    required this.id,
    this.email,
    this.imageUrl,
    this.lastName,
    this.lastSeen,
    this.metadata,
    this.role,
  });

  /// Creates UserOld from a map (decoded JSON).
  UserOld.fromJson(Map<String, dynamic> json)
      : createdAt = json['createdAt'] as int?,
        firstName = json['firstName'] as String?,
        id = json['id'] as String,
        email = json['email'] as String,
        imageUrl = json['imageUrl'] as String?,
        lastName = json['lastName'] as String?,
        lastSeen = json['lastSeen'] as int?,
        metadata = json['metadata'] as Map<String, dynamic>?,
        role = getRoleFromString(json['role'] as String?);

  /// Converts UserOld to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => {
        'createdAt': createdAt,
        'firstName': firstName,
        'id': id,
        'email': email,
        'imageUrl': imageUrl,
        'lastName': lastName,
        'lastSeen': lastSeen,
        'metadata': metadata,
        'role': role?.toShortString(),
      };

  /// Creates a copy of the UserOld with an updated data.
  /// [firstName], [imageUrl], [lastName], [lastSeen] and [role] with
  /// null values will nullify existing values.
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  UserOld copyWith({
    String? firstName,
    String? imageUrl,
    String? lastName,
    String? email,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
  }) {
    return UserOld(
      firstName: firstName,
      id: id,
      email: email,
      imageUrl: imageUrl,
      lastName: lastName,
      lastSeen: lastSeen,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      role: role,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props =>
      [createdAt, firstName, id, email, imageUrl, lastName, lastSeen, metadata, role];

  /// Created UserOld timestamp, in ms
  final int? createdAt;

  /// First name of the UserOld
  final String? firstName;

  /// Unique ID of the UserOld
  final String id;

  final String? email;

  /// Remote image URL representing UserOld's avatar
  final String? imageUrl;

  /// Last name of the UserOld
  final String? lastName;

  /// Timestamp when UserOld was last visible, in ms
  final int? lastSeen;

  /// Additional custom metadata or attributes related to the UserOld
  final Map<String, dynamic>? metadata;

  /// UserOld [Role]
  final Role? role;
}
