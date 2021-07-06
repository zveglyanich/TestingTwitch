//
//  StorageRealmManager.swift
//  TestingTwitch
//
//  Created by Pavel Zveglyanich on 7/6/21.
//

import Foundation
import RealmSwift

enum RealmErrors: Error {
	
	var error: String {
		switch self {
		case .ErrorOfReadDataBase: return "Data isn't read in Database"
		case .ErrorOfWriteInDataBase: return "Current data isn't write in Database"
		case .ErrorOfDeleteInDataBase: return "Current data isn't delete in Database"
		}
	}
	
	case ErrorOfWriteInDataBase
	case ErrorOfDeleteInDataBase
	case ErrorOfReadDataBase
}


protocol Storageprotocol: class {
	func saveData(_ data: [SaveData]) throws
	var realm: Realm? { get }
}

class StorgeRealmManager: Storageprotocol {
	
	
	static let shared = StorgeRealmManager()
	
	var realm: Realm? {
		do {
			return try Realm()
		} catch {
			print (RealmErrors.ErrorOfReadDataBase.error)
		}
		return self.realm
	}
	
	func saveData(_ data: [SaveData]) throws {
		guard realm != nil else { throw RealmErrors.ErrorOfWriteInDataBase}
		try realm!.write{
			realm!.add(data)
		}
		
	}
}


class SaveData: Object {
	@objc dynamic var image: String = ""
	@objc dynamic var name: String = ""
	@objc dynamic var channels: Int = 0
	@objc dynamic var viewers: Int = 0
	
}
