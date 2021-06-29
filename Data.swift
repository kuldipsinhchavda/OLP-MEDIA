

import Foundation
struct Data : Codable {
	let videos : [Videos]?

	enum CodingKeys: String, CodingKey {

		case videos = "videos"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		videos = try values.decodeIfPresent([Videos].self, forKey: .videos)
	}

}
