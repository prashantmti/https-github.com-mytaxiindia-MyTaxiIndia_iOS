//
//  SearchTaxiView.h
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/15/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "AutoCityView.h"
#import "CabListView.h"
#import "CabDetailsView.h"

#import "PopPickerView.h"


@interface SearchTaxiView : BaseView
{
    IBOutlet UIView * DPView1;
    IBOutlet UIView * DPView2;
    
    
    
    
    UIView *popSuperView;
    UIView *popWindowView;
    
    
}


@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentTab;

@property (weak, nonatomic) IBOutlet UIButton *owBtn;
@property (weak, nonatomic) IBOutlet UIButton *rtBtn;



@property (strong, nonatomic) IBOutlet UITextField *TFDepartureCity;
@property (strong, nonatomic) IBOutlet UITextField *TFarrivalCity;


//@property (strong, nonatomic) IBOutlet UILabel *TFDepartureCity;
//@property (strong, nonatomic) IBOutlet UILabel *TFarrivalCity;
//


@property (weak, nonatomic) IBOutlet UIButton *TFaddMoreCity;
@property (weak, nonatomic) IBOutlet UIButton *BTNsearchTaxi;




@property (strong, nonatomic) NSString *selectedLocation;


@property(strong,nonatomic) NSString *selectedDateFromDP;

@property(strong,nonatomic) UIDatePicker *datePicker;


@property(strong,nonatomic) NSDate *pickupDate,*dropDate;

@property(strong,nonatomic) IBOutlet UILabel *DPView1Lbldd;
@property(strong,nonatomic) IBOutlet UILabel *DPView2Lbldd;

@property(strong,nonatomic) IBOutlet UILabel *DPView1Lblmm;
@property(strong,nonatomic) IBOutlet UILabel *DPView2Lblmm;

@property (strong, nonatomic) NSArray *cabList;


@end
