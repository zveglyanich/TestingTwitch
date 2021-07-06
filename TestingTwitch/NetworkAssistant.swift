//
//  NetworkAssistant.swift
//  TestingTwitch
//
//  Created by Pavel Zveglyanich on 7/6/21.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkAssistantProtocol {
	func request (_ request: Alamofire.URLRequestConvertible, completion: @escaping (Result<[DataModel]?>) -> Void)
}

class NetworkManager: NetworkAssistantProtocol {
	static let shared = NetworkManager()
	
	func request (_ request: Alamofire.URLRequestConvertible, completion: @escaping (Result<[DataModel]?>) -> Void) {
		Alamofire.request(request).responseJSON { response in
			switch response.result {
			case .success:
				if let data = response.value  {
						let json = JSON(data)
						var courses: [DataModel]? = []
						courses = DataModel.getArray(from: json)
						completion(.success(courses))
				} else {
					print("error no data")
					let error = NSError(domain: "Empty response", code: -1003, userInfo: nil)
					completion(.failure(error))
				}
			case .failure(let error):
				print (error)
				completion(.failure(error))
			}
		}
	}
	
}

