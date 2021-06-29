
import Foundation
struct Videos : Codable {
	let id : Int?
	let video_title : String?
	let video_cover : String?
	let category_id : Int?
	let short_description : String?
	let video : String?
	let transcoded_video_url : String?
	let deep_link : String?
	let job_id : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case video_title = "video_title"
		case video_cover = "video_cover"
		case category_id = "category_id"
		case short_description = "short_description"
		case video = "video"
		case transcoded_video_url = "transcoded_video_url"
		case deep_link = "deep_link"
		case job_id = "job_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		video_title = try values.decodeIfPresent(String.self, forKey: .video_title)
		video_cover = try values.decodeIfPresent(String.self, forKey: .video_cover)
		category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
		short_description = try values.decodeIfPresent(String.self, forKey: .short_description)
		video = try values.decodeIfPresent(String.self, forKey: .video)
		transcoded_video_url = try values.decodeIfPresent(String.self, forKey: .transcoded_video_url)
		deep_link = try values.decodeIfPresent(String.self, forKey: .deep_link)
		job_id = try values.decodeIfPresent(String.self, forKey: .job_id)
	}

}
