//
//  BaseView.h
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/16/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServiceClass.h"

@interface BaseView : UIViewController<NSURLSessionDelegate>
{
    UIToolbar *toolBar;
    
    NSDictionary *resultDic;
}

-(NSArray*)getLocationArray;


//-(void)showPickerView;

//-(void)addDatePickerWithToolBar;

-(void)alertView;

-(NSMutableArray*)returnReplaceArray:(NSArray*)nullArray;

//  for validation
-(BOOL)validateString:(NSString *)string;
-(BOOL)validateEmail:(NSString *)email;
-(BOOL)validateMobile:(NSString *)mobile;


//  alertView methods
-(void)alertWithText:(NSString*)title message:(NSString*)message;
-(void)alertWithAction:(NSString*)title message:(NSString*)message;

-(UIColor*)colorWithCode:(NSString*)hex;
@end
