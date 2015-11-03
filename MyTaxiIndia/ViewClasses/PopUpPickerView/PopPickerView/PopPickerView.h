//
//  PopPickerView.h
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/31/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shareData.h"


@interface PopPickerView : BaseView<UIPickerViewDataSource,UIPickerViewDelegate>
{
    IBOutlet UIPickerView *picker;
    NSArray *dataArray;
    NSMutableArray  *availabilityArray;
    NSInteger index;
    shareData *sdata;
    
    IBOutlet UIDatePicker *datePicker;
}

@property (strong,nonatomic) NSString *seatingCapacity;
@property (assign,nonatomic) NSInteger selectedValue;


// call back function, a block
@property (nonatomic, strong) void (^onDismiss)(UIViewController *sender, NSObject* shareData);


@end
