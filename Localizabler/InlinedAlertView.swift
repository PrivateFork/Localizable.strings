//
//  InlinedAlertView.swift
//  Localizabler
//
//  Created by Baluta Cristian on 07/11/15.
//  Copyright © 2015 Cristian Baluta. All rights reserved.
//

import Cocoa

class InlinedAlertView: NSView {
	
	@IBOutlet var textField: NSTextField?
	
	var message: String {
		get {
			return self.textField!.stringValue
		}
		set {
			self.textField!.stringValue = newValue
		}
	}
	
	class func instanceFromNib() -> InlinedAlertView {
		
		var viewArray: NSArray = []
		_ = Bundle.main.loadNibNamed("InlinedAlertView", owner: self, topLevelObjects: &viewArray)
		if let view = viewArray[0] as? InlinedAlertView {
			return view
		} else if let view = viewArray[1] as? InlinedAlertView {
			return view
		}
		return InlinedAlertView()
	}
}
