//
//  Terms.swift
//  Localizabler
//
//  Created by Cristian Baluta on 02/10/15.
//  Copyright © 2015 Cristian Baluta. All rights reserved.
//

import Foundation

enum LocalizationFileError: ErrorType {
	case FileNotFound(url: NSURL)
}

protocol LocalizationFile {
	
	var url: NSURL? {get}
	/// Whenever a term or translation changes a hasChanges flag is set
	var hasChanges: Bool {get}
	
	init(url: NSURL) throws
	init(content: String)
	
	/// Returns all lines found in the file in their order, comments and blank lines including
	func allLines() -> [Line]
	
	/// Returns all the terms found in the file in their order
    func allTerms() -> [String]
	
	/// Returns the translation for the specified term
    func translationForTerm(term: String) -> String
	
	/// Updates the term with a new value
	func updateTerm(term: String, newValue: String)
	
	/// Updates the translation for the specified term. You need to call  save for saving to the original file
    func updateTranslationForTerm(term: String, newValue: String)
	
	func addLine(line: Line)
	
	/// This will convert dictionaries back to string in order to save to the original file
	func content() -> String
}
