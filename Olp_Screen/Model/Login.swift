// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try? newJSONDecoder().decode(Login.self, from: jsonData)

import Foundation

// MARK: - Login
struct Login: Codable {
    let data: DataClass
    let type: String
    let status: Int
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let token: Token
    let user: User
}

// MARK: - Token
struct Token: Codable {
    let id: Int
    let authToken: String
    let userID: Int
    let deviceType, deviceToken: JSONNull?
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case authToken = "auth_token"
        case userID = "user_id"
        case deviceType = "device_type"
        case deviceToken = "device_token"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let email, fullName, userName, country: String
    let profilePic: String
    let newsletter: Bool
    let resetPasswordToken, resetPasswordSentAt, rememberCreatedAt: JSONNull?
    let createdAt, updatedAt, status, bio: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case fullName = "full_name"
        case userName = "user_name"
        case country
        case profilePic = "profile_pic"
        case newsletter
        case resetPasswordToken = "reset_password_token"
        case resetPasswordSentAt = "reset_password_sent_at"
        case rememberCreatedAt = "remember_created_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case status, bio
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
