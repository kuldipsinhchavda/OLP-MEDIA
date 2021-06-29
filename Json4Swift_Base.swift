

import Foundation
struct Json4Swift_Base : Codable {
	let data : Data?
	let type : String?
	let status : Int?
	let message : String?

	enum CodingKeys: String, CodingKey {

		case data = "data"
		case type = "type"
		case status = "status"
		case message = "message"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		data = try values.decodeIfPresent(Data.self, forKey: .data)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		message = try values.decodeIfPresent(String.self, forKey: .message)
	}

}
