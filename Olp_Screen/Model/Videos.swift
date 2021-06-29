
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try? newJSONDecoder().decode(Login.self, from: jsonData)

import Foundation

// MARK: - Login
class Login1: Codable {
    let data: DataClass
    let type: String
    let status: Int
    let message: String

    init(data: DataClass, type: String, status: Int, message: String) {
        self.data = data
        self.type = type
        self.status = status
        self.message = message
    }
}

// MARK: - DataClass
class DataClass11: Codable {
    let token: Token
    let user: User

    init(token: Token, user: User) {
        self.token = token
        self.user = user
    }
}

// MARK: - Token
class Token: Codable {
    let id: Int
    let authToken: String
    let userID: Int
    let deviceType, deviceToken: JSONNull?
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case authToken = "auth_token"
        case userID = "user_id"
        case deviceType = "device_type"
        case deviceToken = "device_token"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    init(id: Int, authToken: String, userID: Int, deviceType: JSONNull?, deviceToken: JSONNull?, createdAt: String, updatedAt: String) {
        self.id = id
        self.authToken = authToken
        self.userID = userID
        self.deviceType = deviceType
        self.deviceToken = deviceToken
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

// MARK: - User
class User: Codable {
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
        case country = "country"
        case profilePic = "profile_pic"
        case newsletter = "newsletter"
        case resetPasswordToken = "reset_password_token"
        case resetPasswordSentAt = "reset_password_sent_at"
        case rememberCreatedAt = "remember_created_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case status, bio
    }

    init(id: Int, email: String, fullName: String, userName: String, country: String, profilePic: String, newsletter: Bool, resetPasswordToken: JSONNull?, resetPasswordSentAt: JSONNull?, rememberCreatedAt: JSONNull?, createdAt: String, updatedAt: String, status: String, bio: String) {
        self.id = id
        self.email = email
        self.fullName = fullName
        self.userName = userName
        self.country = country
        self.profilePic = profilePic
        self.newsletter = newsletter
        self.resetPasswordToken = resetPasswordToken
        self.resetPasswordSentAt = resetPasswordSentAt
        self.rememberCreatedAt = rememberCreatedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.status = status
        self.bio = bio
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
