//
//  PKColumnTableCustomCell.swift
//  Pods
//
//  Created by Prateek Kansara on 17/02/17.
//
//

import Foundation
import UIKit


class PKColumnTableCustomCell : UITableViewCell{
    
    var defaultUICellData = [
                kPKTableColumnTitleFont : PKTableConstants().defaultFont!,
                kPKTableColumnTitleColor : PKTableConstants().defaultTextColor,
                kPKTableColumnTitleAlignment : PKTableConstants().defaultTextAlignment,
                kPKTableCellTextAlignment : PKTableConstants().defaultTextAlignment,
                kPKTableCellTextColor : PKTableConstants().defaultTextColor,
                kPKTableCellRowTextFont : PKTableConstants().defaultFont!,
                kPKTableCellBackgroundColor : PKTableConstants().defaultBkgColor,
                kPKTableColumnTextViewBkg : PKTableConstants().defaultColumnTitleViewBkg,
                kPKTableCellTextViewBkg : PKTableConstants().defaultCellTitleViewBkg
                             ] as [String : Any]
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textViewArray = [UITextView]()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textViewArray.removeAll()
        gRect = frame
    }
    
    var gRect : CGRect!
    func setUITextDict(dictData : [String : Any]) {
        let keys = dictData.keys
        for key in keys{
            defaultUICellData[key] = dictData[key]
        }
        
        if textViewArray.count != 0{
            setTextViewUIElements(isHeader: gIsHeader)
        }
    }
    
    fileprivate var gIsHeader = false
    func setColumnData(data : NSArray, isHeaderTitle : Bool) {
        gIsHeader = isHeaderTitle
        var textViewX : CGFloat = 0
        for i in 0..<data.count{
            if let cellData = data[i] as? NSDictionary{
                let cellWidth = gRect.width*CGFloat(cellData[kPKCellWeightKey] as! Double)
                let cellTextView = UITextView.init(frame: CGRect(x:textViewX, y:frame.origin.y, width:cellWidth, height:frame.height))
                cellTextView.isScrollEnabled = false
                cellTextView.text = cellData[kPKCellTitleKey] as! String
                textViewArray.append(cellTextView)
                addSubview(cellTextView)
                textViewX+=cellWidth
            }
        }
        setTextViewUIElements(isHeader: isHeaderTitle)
    }
    
    fileprivate func setTextViewUIElements(isHeader : Bool){
        
        for cellTextView in textViewArray{
            cellTextView.textColor = defaultUICellData[kPKTableCellTextColor] as! UIColor?
            cellTextView.textAlignment = defaultUICellData[kPKTableCellTextAlignment] as! NSTextAlignment
            cellTextView.font = defaultUICellData[kPKTableCellRowTextFont] as! UIFont?
            cellTextView.backgroundColor = defaultUICellData[kPKTableCellTextViewBkg] as! UIColor?
            if isHeader{
                cellTextView.textColor = defaultUICellData[kPKTableColumnTitleColor] as! UIColor?
                cellTextView.textAlignment = defaultUICellData[kPKTableColumnTitleAlignment] as! NSTextAlignment
                cellTextView.font = defaultUICellData[kPKTableColumnTitleFont] as! UIFont?
                cellTextView.backgroundColor = defaultUICellData[kPKTableColumnTextViewBkg] as! UIColor?
            }
        }
    }
    
    func addShadowToViews(cornerRadius: CGFloat){
        
        self.contentView.layer.cornerRadius = cornerRadius
        self.contentView.layer.shadowRadius = cornerRadius
        self.contentView.layer.shadowColor = UIColor.darkGray.cgColor
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.contentView.layer.shadowOpacity = 0.3
    }
    
    func removeShadowFromView(cornerRadius: CGFloat){
        self.contentView.layer.cornerRadius = cornerRadius
        self.contentView.layer.shadowRadius = cornerRadius
        self.contentView.layer.shadowColor = UIColor.clear.cgColor
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.contentView.layer.shadowOpacity = 0.0
    }
}
