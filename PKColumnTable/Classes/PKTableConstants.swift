//
//  PKTableConstants.swift
//  Pods
//
//  Created by Prateek Kansara on 17/02/17.
//
//

import Foundation

/// Setting Library constants
class PKTableConstants: NSObject {
    
    let defaultFont = UIFont.init(name: "AvenirNext-Medium", size: 14.0)
    let defaultTextColor = UIColor.black
    let defaultBkgColor = UIColor.white
    let defaultTextAlignment = NSTextAlignment.center
    
    let defaultColumnTitleViewBkg = UIColor.clear
    let defaultCellTitleViewBkg = UIColor.clear
    
    let defaultHeaderCellHeight : CGFloat = 40
    let defaultTableCellHeight : CGFloat = 40
}

/// Public constants for end user to update
public let kPKTableColumnTitleFont = "kTableColumnTitleFont"
public let kPKTableColumnTitleColor = "kTableColumnTitleColor"
public let kPKTableColumnTitleAlignment = "kPKTableColumnTitleAlignment"
public let kPKTableCellTextAlignment = "kPKTableCellTextAlignment"
public let kPKTableCellTextColor = "kTableCellTextColor"
public let kPKTableCellRowTextFont = "kTableCellRowTextFont"
public let kPKTableCellBackgroundColor = "kTableCellBackgroundColor"

public let kPKTableColumnTextViewBkg = "kPKTableColumnTextViewBkg"
public let kPKTableCellTextViewBkg = "kPKTableCellTextViewBkg"

let kPKCellTitleKey = "kCellTitleKey"
let kPKCellWeightKey = "kCellWeightKey"

public let kPKHeaderBKG = "kPKHeaderBKG"
public let kPKTableBKG = "kPKTableBKG"
public let kPKScrollBKG = "kPKScrollBKG"
public let kPKViewBKG = "kPKViewBKG"
