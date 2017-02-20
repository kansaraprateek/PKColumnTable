//
//  PKColumnTable.swift
//  Pods
//
//  Created by Prateek Kansara on 17/02/17.
//
//

import Foundation
import QuartzCore

/// Delegate method to handle selection on table view row
@objc public protocol PKColumnTableDelegate : NSObjectProtocol{
    
     /// Method called when tableview row selected
     ///
     /// - Parameter atIndex: IndexPath object with selected row indexpath.
     func didSelectRow(atIndex : IndexPath)
}

public class PKColumTable: UIView {
    
    let scrollView : UIScrollView = UIScrollView()
    fileprivate let tableView : UITableView = UITableView()
    
    open weak  var delegate : PKColumnTableDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// Defaul views background values
    var defaultUITableData = [
        kPKHeaderBKG : PKTableConstants().defaultBkgColor,
        kPKTableBKG : PKTableConstants().defaultBkgColor,
        kPKScrollBKG : PKTableConstants().defaultBkgColor,
        kPKViewBKG : PKTableConstants().defaultBkgColor
        ] as [String : Any]
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override public func awakeFromNib() {
        self.setNeedsLayout()
        
        let tapGesture = UILongPressGestureRecognizer.init(target: self, action: #selector(self.handleTap(_:)))
        tapGesture.minimumPressDuration = 0.1
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    fileprivate var gRect : CGRect!
    
    /// Initializing view with frame and size
    fileprivate func initializeViews(){
        
        tableView.frame = bounds
        layoutIfNeeded()
        scrollView.frame = bounds
        tableView.isUserInteractionEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView.init(frame: .zero)
        gRect = frame
        tableView.estimatedRowHeight = PKTableConstants().defaultTableCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.removeFromSuperview()
        scrollView.removeFromSuperview()
        addSubview(scrollView)
        scrollView.addSubview(tableView)
    }
    
    /// Method to update views with Background values
    fileprivate func updatinUIValues(){
        tableView.backgroundColor = defaultUITableData[kPKTableBKG] as! UIColor?
        scrollView.backgroundColor = defaultUITableData[kPKTableBKG] as! UIColor?
        backgroundColor = defaultUITableData[kPKTableBKG] as! UIColor?
    }
    
    fileprivate var CellUIData : [String:Any]?
    
    ///  Method to update current UI values with new user given values
    ///
    /// - Parameter data: [String:Any] type object with public constant keys and there respective values
    public func setupTableUI(data : [String: Any]?){
        let keys = data?.keys
        if keys != nil{
            for key in keys!{
                defaultUITableData[key] = data?[key]
            }
        }
        CellUIData = data
        updatinUIValues()
        tableView.reloadData()
    }
    
    /// Method to set horizontal scrolling or not
    ///
    /// - Parameter isScrolling: Bool variable to set scrolling enable or disable
    public func setScrollHorizontal(isScrolling : Bool){
        initializeViews()
        if isScrolling{
            scrollView.contentSize = CGSize.init(width: tableView.frame.width, height: tableView.frame.height)
            gRect = tableView.frame
        }
        else{
            scrollView.contentSize = CGSize(width : 0, height: 0)
        }
        if columnTitles.count>0{
            setHeaderWithColumnData()
        }
        tableView.reloadData()
    }
    
    fileprivate var isFloating : Bool = false
    fileprivate var gColumnWidths = NSArray()
    fileprivate var columnTitles = NSArray()
    fileprivate var tableData = NSArray()
    
    /// Method to set Table header column and data values
    ///
    /// - Parameters:
    ///   - titles: NSArray object with title values
    ///   - data: 2-D array object with table data values
    ///   - columnWidths: NSArray object with column width in percentage with respect to frame
    ///   - isFloatingHeader: Wheather to make the header float or not.
    public func setTableColumnTitles(titles : NSArray, data : NSArray, columnWidths : NSArray, isFloatingHeader : Bool){
        if tableView.frame.width == 0{
            initializeViews()
        }
        columnTitles = titles
        tableData = data
        gColumnWidths = columnWidths
        isFloating = isFloatingHeader
        
        setHeaderWithColumnData()
        tableView.reloadData()
    }
    
    var headerHeight : CGFloat = PKTableConstants().defaultHeaderCellHeight
    fileprivate var gHeaderView : PKColumnTableCustomCell!
    
    /// Creating a header view for table with column values
    fileprivate func setHeaderWithColumnData(){
        
        let headerView = PKColumnTableCustomCell.init(style: .default, reuseIdentifier: "header")
        headerView.frame = CGRect(x: 0, y:0, width : gRect.width, height: headerHeight)
        headerView.gRect = gRect
        let CellData = NSMutableArray()
        for i in 0..<columnTitles.count{
            CellData.add([kPKCellTitleKey: columnTitles[i], kPKCellWeightKey: gColumnWidths[i]])
        }
        if CellUIData != nil{
            headerView.setUITextDict(dictData: CellUIData!)
        }
        headerView.setColumnData(data: CellData, isHeaderTitle: true)
        gHeaderView = headerView
        
        tableView.tableHeaderView = nil
        if !isFloating{
           tableView.tableHeaderView = gHeaderView
        }
    }
    
    
    /// Method to handle tap gesture on PKColumnTable
    ///
    /// - Parameter getsureRecognizer: UILongPressGestureRecognizer object to handle the tap gesture
    @objc fileprivate func handleTap(_ getsureRecognizer : UILongPressGestureRecognizer){
        
        let touchPoint : CGPoint = getsureRecognizer.location(in: tableView)
        if let indexpath = tableView.indexPathForRow(at: touchPoint) {
            let _ : PKColumnTableCustomCell = tableView.cellForRow(at: indexpath) as! PKColumnTableCustomCell
            
            switch getsureRecognizer.state {
            case .began:
                if self.delegate?.responds(to: #selector(PKColumnTableDelegate.didSelectRow(atIndex:))) != nil{
                    delegate?.didSelectRow(atIndex: indexpath)
                }
                break
            case .ended:
                
                break
            default:
                break
            }
        }
    }
}

extension PKColumTable : UITableViewDelegate, UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = PKColumnTableCustomCell.init(style: .default, reuseIdentifier: "Cell")
        cell.gRect = gRect
        let cellValueData = NSMutableArray()
        for i in 0..<(tableData[indexPath.row] as AnyObject).count{
            cellValueData.add([kPKCellTitleKey: (tableData[indexPath.row] as AnyObject)[i], kPKCellWeightKey: gColumnWidths[i]])
        }
        if CellUIData != nil{
            cell.setUITextDict(dictData: CellUIData!)
        }
        cell.setColumnData(data: cellValueData, isHeaderTitle: false)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if isFloating{
            return gHeaderView.frame.height
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if isFloating && (gHeaderView != nil){
            return gHeaderView
        }
        return nil
    }
}
