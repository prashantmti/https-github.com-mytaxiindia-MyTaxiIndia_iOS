//
//  CabListViewCell.h
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/27/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CabListViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *cabIMG;
@property (strong, nonatomic) IBOutlet UILabel *cabName;
@property (strong, nonatomic) IBOutlet UILabel *availableSeat;
@property (strong, nonatomic) IBOutlet UILabel *totalHrs;
@property (strong, nonatomic) IBOutlet UILabel *baseAmount;
@property (strong, nonatomic) IBOutlet UILabel *totalAmount;
@end
