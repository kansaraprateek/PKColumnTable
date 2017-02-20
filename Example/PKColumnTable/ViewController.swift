//
//  ViewController.swift
//  PKColumnTable
//
//  Created by kansaraprateek on 02/17/2017.
//  Copyright (c) 2017 kansaraprateek. All rights reserved.
//

import UIKit
import PKColumnTable

class ViewController: UIViewController {

    
    @IBOutlet var itemTable: PKColumTable!
    
    
    let tableData = [["1", "2", "3"],
                     ["4", "5", "6"],
                     ["7", "8", "9"],
                     ["10", "12", "13"],
                     ["14", "24", "34"],
                     ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemTable.setScrollHorizontal(isScrolling: true)
//        itemTable.setupTableUI(data: [kPKTableBKG:UIColor.red, kPKTableCellBackgroundColor: UIColor.red])
        itemTable.delegate = self
        itemTable.setTableColumnTitles(titles: ["Column 1", "Column 2", "Column 3"], data: tableData as NSArray, columnWidths: [0.3, 0.3 , 0.4], isFloatingHeader: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController : PKColumnTableDelegate{
    func didSelectRow(atIndex: IndexPath) {
        print ("Row tapped : \(atIndex.row)")
    }
}
