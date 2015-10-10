//
//  KeysTableViewDataSource.swift
//  Localizabler
//
//  Created by Baluta Cristian on 06/10/15.
//  Copyright © 2015 Cristian Baluta. All rights reserved.
//

import Cocoa

class KeysTableViewDataSource: NSObject, NSTableViewDataSource, NSTableViewDelegate {
	
	var data = [KeyData]()
	var onRowPressed: ((rowNumber: Int, key: KeyData) -> Void)?
	
	init(tableView: NSTableView) {
		
		super.init()
		
		tableView.setDataSource( self )
		tableView.setDelegate( self )
	}
	
	func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
		
		return data.count
	}
	
	func tableView(tableView: NSTableView,
		objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
			
			let theData: KeyData = data[row]
			if (tableColumn?.identifier == "key") {
				return theData.value
			}
			else if (tableColumn?.identifier == "status") {
				return NSImage(named: theData.translationChanged
					? NSImageNameStatusPartiallyAvailable
					: NSImageNameStatusAvailable)
			}
			return nil
	}
	
	func tableViewSelectionDidChange(aNotification: NSNotification) {
		
		if let rowView: AnyObject = aNotification.object {
			onRowPressed?(rowNumber: rowView.selectedRow, key: self.data[rowView.selectedRow])
		}
	}
	
	func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
		return 20
	}

}
