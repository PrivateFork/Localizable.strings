//
//  SearchAndroidLocalizations.swift
//  Localizabler
//
//  Created by Baluta Cristian on 07/11/15.
//  Copyright © 2015 Cristian Baluta. All rights reserved.
//

import Foundation

class SearchAndroidLocalizations: NSObject, SearchLocalizations {

	func searchInDirectory(dir: NSURL, result: [String: NSURL] -> Void) {
		
		let fileManager = NSFileManager.defaultManager()
		do {
			let files = try fileManager.contentsOfDirectoryAtURL(dir, includingPropertiesForKeys: nil,
				options: NSDirectoryEnumerationOptions.SkipsSubdirectoryDescendants)
			var resultDict = [String: NSURL]()
			//...
			result(resultDict)
		} catch {
			RCLogO("some error while reading files")
		}
	}
}
