//
//  CabListView.h
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/27/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CabListViewCell.h"
#import "CabDetailsView.h"
#import "PopPickerView.h"


@interface CabListView : BaseView<UITableViewDelegate,UITableViewDataSource>
{
}
@property (weak, nonatomic) IBOutlet UITableView *TBcabList;

@property (strong, nonatomic) NSArray *cabList;

//@property (assign, nonatomic) NSInteger noOfCars;
@end
