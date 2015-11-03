//
//  IDPickerView.m
//  Wiwigo
//
//  Created by EL Group iMac 1 on 8/28/15.
//  Copyright (c) 2015 EL Group Imac 2. All rights reserved.
//

#import "IDPickerView.h"

@implementation IDPickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)addIDDataPickerWithToolBar:(UITextField*)textField{
    
    picker = [[UIPickerView alloc]init];
    picker.delegate = self;
    picker.dataSource = self;
    
    
    
//    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(pickerDone:)];
////    doneBtn.pickerTF = textField;
////    doneBtn.pickerView=picker;
//    doneBtn.tintColor=[UIColor whiteColor];
//    
//    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
//    
//    UIBarButtonItem *cancelBtn=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(pickerCancel:)];
////    cancelBtn.textField = textField;
// //    doneBtn.pickerView=picker;
//    cancelBtn.tintColor=[UIColor whiteColor];
//    
//    [toolBar setItems:[[NSArray alloc] initWithObjects:cancelBtn,spacer,doneBtn,nil]];
//    [toolBar setBarStyle:UIBarStyleBlackOpaque];
//    [toolBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
    
    //currentTextField.inputAccessoryView  = toolBar;
    //currentTextField.inputView = picker;
    [picker reloadAllComponents];
}

-(void)addDatePickerWithToolBar:(UITextField*)textField
{
    //Set Date Picker
    UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectZero];
    datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    
    //Set Date
    [datePicker setDate:[NSDate date]];
    
    textField.inputAccessoryView = [self addToolBar];
    textField.inputView = datePicker;
}

-(UIToolbar*)addToolBar
{
    //Add ToolBar
    CGFloat tbW,tbH;
    tbW=self.window.frame.size.width;tbH=40;
    
    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,tbW,tbH)];

    UIBarButtonItem *IDLeftTBBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(IDLeftTBBtnAction:)];
    IDLeftTBBtn.tintColor=[UIColor whiteColor];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *IDRightTBBtn=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(IDRightTBBtnAction:)];
    IDRightTBBtn.tintColor=[UIColor whiteColor];
    
    [toolBar setItems:[[NSArray alloc] initWithObjects:IDLeftTBBtn,spacer,IDRightTBBtn,nil]];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    [toolBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
    
    return toolBar;
}
@end
