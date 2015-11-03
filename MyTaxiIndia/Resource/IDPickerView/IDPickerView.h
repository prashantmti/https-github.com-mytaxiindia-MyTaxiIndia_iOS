//
//  IDPickerView.h
//  Wiwigo
//
//  Created by EL Group iMac 1 on 8/28/15.
//  Copyright (c) 2015 EL Group Imac 2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDPickerView : UIPickerView<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *picker;
    NSArray * pickerArray;
    UITextField * pickerTF;
}


@property (strong, nonatomic) IBOutlet UIDatePicker* datePicker;
@property (strong, nonatomic) IBOutlet UIBarButtonItem* doneButton;

-(IBAction) buttonDonePush:(id)sender;

@end
