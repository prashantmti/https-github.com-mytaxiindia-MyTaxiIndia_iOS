//
//  AutoCityView.h
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/16/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "SearchTaxiView.h"

@interface AutoCityView : BaseView<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
        NSDictionary * resultWSDic;
    
    NSOperationQueue *operationQueue;
    NSInvocationOperation *NIO;
}

@property (weak, nonatomic) IBOutlet UISearchBar *SBautoSearch;


@property (weak, nonatomic) IBOutlet UITableView *TBcityList;

@property(strong, nonatomic) NSArray * cityArray;
@property(strong, nonatomic) NSArray * refCityArray;




@end
