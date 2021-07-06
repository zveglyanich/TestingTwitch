//
//  DataModel.swift
//  TestingTwitch
//
//  Created by Pavel Zveglyanich on 7/6/21.
//


import UIKit
import SwiftyJSON

struct DataModel: Decodable {
	
	var image: String
	var name: String
	var channels: Int
	var viewers: Int
	
	init(of json: JSON) {
		self.image = json["game"]["logo"]["medium"].stringValue
		self.name = json["game"]["name"].stringValue
		self.channels = json["channels"].intValue
		self.viewers = json["viewers"].intValue
	}
	
	init(image: String, name: String, channels: Int, viewers: Int) {
		self.image = image
		self.name = name
		self.channels = channels
		self.viewers = viewers
	}
	
	static func getArray(from jsonArray: JSON) -> [DataModel]? {
		guard let jsonArray = jsonArray["top"].array else { return nil}
		return jsonArray.compactMap { DataModel(of: $0) }
	}
}
