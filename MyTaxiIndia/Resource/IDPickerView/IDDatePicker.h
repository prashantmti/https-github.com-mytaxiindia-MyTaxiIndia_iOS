//
//  IDDatePicker.h
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/27/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IDDatePickerDelegate <NSObject>

-(void)showDatePickerOnClick;

- (void)cancel:(id)sender;
- (void)done:(id)sender;
@end



@interface IDDatePicker : UIDatePicker

@property (weak, nonatomic) id<IDDatePickerDelegate> DPDelegate;
@property(strong,nonatomic) UIDatePicker *datePicker;
@end
