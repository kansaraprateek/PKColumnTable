# PKColumnTable

[![CI Status](http://img.shields.io/travis/kansaraprateek/PKColumnTable.svg?style=flat)](https://travis-ci.org/kansaraprateek/PKColumnTable)
[![Version](https://img.shields.io/cocoapods/v/PKColumnTable.svg?style=flat)](http://cocoapods.org/pods/PKColumnTable)
[![License](https://img.shields.io/cocoapods/l/PKColumnTable.svg?style=flat)](http://cocoapods.org/pods/PKColumnTable)
[![Platform](https://img.shields.io/cocoapods/p/PKColumnTable.svg?style=flat)](http://cocoapods.org/pods/PKColumnTable)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PKColumnTable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PKColumnTable"
```

```ruby

import PKColumnTable

// Either set UIView as PKColumnTable in storyboard or create a object and add as subview.

var columnExample = PKColumnTable(frame : CGRect(x:0,y:0,width:200,height:200))

```

## Table Data 

Create 2-D array to insert data at required rows of colum. For eg

```ruby
let tableData = [["1", "2", "3"],
["4", "5", "6"],
["7", "8", "9"],
["10", "12", "13"],
["14", "24", "34"],
]
```

## Setting Column 

Column width array is in reference to frame size.

```ruby
columnExample.setTableColumnTitles(titles: ["Column 1", "Column 2", "Column 3"], data: tableData as NSArray, columnWidths: [0.3, 0.3 , 0.4], isFloatingHeader: true)

```

To get response on table row clicked set columnExample delegate to current viewcontroller- 

```ruby
columnExample.delegate = self

```

And override method - 

```ruby
    didSelectRow(atIndex : IndexPath)
```

## Manage UI

```ruby

columnExample.setupTableUI(data: [kPKTableBKG:UIColor.red, kPKTableCellBackgroundColor: UIColor.red])
```

* Need to set table UI method before calling  setTableColumnTitles(titles:data:columnWidths:isFloatingHeader:)

Apart from these you can use different UI keys -

// Header UI Keys
kPKTableColumnTitleFont
kPKTableColumnTitleColor
kPKTableColumnTitleAlignment
kPKTableColumnTextViewBkg
kPKHeaderBKG

// Cell UI Keys
kPKTableCellTextAlignment
kPKTableCellTextColor
kPKTableCellRowTextFont
kPKTableCellBackgroundColor
kPKTableCellTextViewBkg

// Table/scrollview/view background
kPKTableBKG
kPKScrollBKG
kPKViewBKG

## Author

kansaraprateek, prateek@tagrem.com

## License

PKColumnTable is available under the MIT license. See the LICENSE file for more info.
