//
//  SearchTaxiView.m
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/15/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import "SearchTaxiView.h"

@interface SearchTaxiView ()

@end

@implementation SearchTaxiView
@synthesize selectedLocation,TFarrivalCity,TFDepartureCity,TFaddMoreCity,datePicker,selectedDateFromDP;

@synthesize DPView1Lbldd,DPView1Lblmm,DPView2Lbldd,DPView2Lblmm;
@synthesize pickupDate,dropDate,cabList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TFarrivalCity.text=@"this is test1";
    TFDepartureCity.text=@"this is test2";
    NSLog(@"log value==>%@",TFarrivalCity.text);
    
    //[self setGesturesOnLabel1];
    //[self setGesturesOnLabel2];

    
    // set date picker on DPView
    [self setGesturesOnDPView1];
    [self setGesturesOnDPView2];
    
    
   //[self abc];
    
   // [self alertView];
    
    
  //  IDDatePicker *DP=[[IDDatePicker alloc]init];
    //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bgView"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 101:{
            AutoCityView *acv = [self.storyboard instantiateViewControllerWithIdentifier:@"AutoCityView"];
            [self presentViewController:acv animated:YES completion:nil];
            break;
        }case 102:{
            AutoCityView *acv = [self.storyboard instantiateViewControllerWithIdentifier:@"AutoCityView"];
            [self presentViewController:acv animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
    NSLog(@"tag====>%ld",(long)textField.tag);
}



// start--  add datepicker on view

- (void)setGesturesOnDPView1
{
    UITapGestureRecognizer* DPViewGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(GesturesOnDPView1:)];
    [DPView1 addGestureRecognizer:DPViewGesture1];
}

- (void)GesturesOnDPView1: (UITapGestureRecognizer *)recognizer
{
    [self addDatePickerWithToolBar:1001];
}

-(void)setGesturesOnDPView2
{
    UITapGestureRecognizer* DPViewGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(GesturesOnDPView2:)];
    [DPView2 addGestureRecognizer:DPViewGesture2];
}

- (void)GesturesOnDPView2: (UITapGestureRecognizer *)recognizer
{
    [self addDatePickerWithToolBar:1002];
}

//  end --  end add datepicker on view





-(void)setGesturesOnLabel1
{
    UITapGestureRecognizer* gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction1:)];
    // if labelView is not set userInteractionEnabled, you must do so
    
    [TFDepartureCity addGestureRecognizer:gesture1];
    [TFDepartureCity setUserInteractionEnabled:YES];
}

- (void)gestureAction1: (UITapGestureRecognizer *)recognizer
{
    //Code to handle the gesture
    
    AutoCityView *acv = [self.storyboard instantiateViewControllerWithIdentifier:@"AutoCityView"];
    [self presentViewController:acv animated:YES completion:nil];
}


-(void)setGesturesOnLabel2
{
    UITapGestureRecognizer* gesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction2:)];
    // if labelView is not set userInteractionEnabled, you must do so
    
    [TFarrivalCity setUserInteractionEnabled:YES];
    [TFarrivalCity addGestureRecognizer:gesture2];
}


- (void)gestureAction2: (UITapGestureRecognizer *)recognizer
{
    NSLog(@"helloooo");
    //Code to handle the gesture
    
   // [self addDatePickerWithToolBar];
    
    //AutoCityView *acv = [self.storyboard instantiateViewControllerWithIdentifier:@"AutoCityView"];
    //[self presentViewController:acv animated:YES completion:nil];
}



-(IBAction)searchTaxi:(id)sender{

    [IDLoader setOnView:self.view withTitle:@"Loading..." animated:YES];
    [self callService];
    //[self showPopPicker];
    
//    if([pickupDate compare:dropDate] != NSOrderedAscending)
//    {
//        [self alertWithText:error message:invalidDate];
//        return;
//    }else{
//        
//        //[self showPopPicker];
//        CabListView *CLV = [self.storyboard instantiateViewControllerWithIdentifier:@"CabListView"];
//        [self.navigationController pushViewController:CLV animated:YES];
//        
//    }
}
/*
-(void)callService1
{
    NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
    //cities=Delhi,Agra&tripType=0&noOfCars=1&startDate=15-12-2015%2017:00&vehicleCategory=ghjk
    //term=ag
    //orth=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo
    
    [postDic setObject:@"44.1" forKey:@"north"];
    [postDic setObject:@"-9.9" forKey:@"south"];
    [postDic setObject:@"-22.4" forKey:@"east"];
    [postDic setObject:@"55.2" forKey:@"west"];
    [postDic setObject:@"lang" forKey:@"lang"];
    [postDic setObject:@"demo" forKey:@"username"];
    
    
    //    [postDic setObject:@"0" forKey:@"tripType"];
    //    [postDic setObject:@"1" forKey:@"noOfCars"];
    //    [postDic setObject:@"15-12-2015 17:00" forKey:@"startDate"];
    //    [postDic setObject:@"ghjk" forKey:@"vehicleCategory"];
    
    [IDWebServiceManager IDWSManager:postDic IDServiceURL:IDServiceURl IDCurrentView:self.view IDIsRequestGET:NO IDIsLoader:NO callback:^(NSError *IDError, IDWebServiceManager *IDWSManager) {
        if (IDError)
        {
            NSLog(@"error==>%@",IDError);
        }
        else
        {
            // NSLog(@"IDResult===>%@",IDWSManager.IDResult);
            
            NSLog(@"result===>%@",[IDWSManager.IDResult valueForKey:@"result"]);
            NSLog(@"status===>%@",[IDWSManager.IDResult valueForKey:@"status"]);
        }
    }];
}


-(void)callService1123
{
    NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
    
    //cities=Delhi,Agra&tripType=0&noOfCars=1&startDate=15-12-2015%2017:00&vehicleCategory=ghjk
    //term=ag
    
    [postDic setObject:@"ag" forKey:@"term"];
//    [postDic setObject:@"0" forKey:@"tripType"];
//    [postDic setObject:@"1" forKey:@"noOfCars"];
//    [postDic setObject:@"15-12-2015 17:00" forKey:@"startDate"];
//    [postDic setObject:@"ghjk" forKey:@"vehicleCategory"];
    
    [IDWebServiceManager IDWSManager:postDic IDServiceURL:IDServiceURl IDCurrentView:self.view IDIsRequestGET:NO IDIsLoader:YES callback:^(NSError *IDError, IDWebServiceManager *IDWSManager) {
        if (IDError)
        {
            NSLog(@"error==>%@",IDError);
        }
        else
        {
           // NSLog(@"IDResult===>%@",IDWSManager.IDResult);
            
            NSLog(@"result===>%@",[IDWSManager.IDResult valueForKey:@"result"]);
            NSLog(@"status===>%@",[IDWSManager.IDResult valueForKey:@"status"]);
        }
    }];
}

-(void)callService
{
    NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
    
    //cities=Delhi,Agra&tripType=0&noOfCars=1&startDate=15-12-2015%2017:00&vehicleCategory=ghjk
    //term=ag
    
    [postDic setObject:@"ag" forKey:@"term"];
    //    [postDic setObject:@"0" forKey:@"tripType"];
    //    [postDic setObject:@"1" forKey:@"noOfCars"];
    //    [postDic setObject:@"15-12-2015 17:00" forKey:@"startDate"];
    //    [postDic setObject:@"ghjk" forKey:@"vehicleCategory"];
    
    
    
    WebServiceClass * WSC;
    WSC=[[WebServiceClass alloc]init];
    
    
    NSDictionary*resultDic;
   // resultDic=[WSC setServiceClass:IDBaseURL serviceUrl:IDServiceURl dataDic:postDic isPOST:NO];
    
    
   // NSLog(@"resultDic===>%@,",resultDic);
    
//    [IDWebServiceManager IDWSManager:postDic IDServiceURL:IDServiceURl IDCurrentView:self.view IDIsRequestGET:NO IDIsLoader:YES callback:^(NSError *IDError, IDWebServiceManager *IDWSManager) {
//        if (IDError)
//        {
//            NSLog(@"error==>%@",IDError);
//        }
//        else
//        {
//            // NSLog(@"IDResult===>%@",IDWSManager.IDResult);
//            
//            NSLog(@"result===>%@",[IDWSManager.IDResult valueForKey:@"result"]);
//            NSLog(@"status===>%@",[IDWSManager.IDResult valueForKey:@"status"]);
//        }
//    }];
}



-(void)callService098
{
    WebServiceClass * WSC;
    WSC=[[WebServiceClass alloc]init];
    
    
   // NSDictionary*resultDic123;
    //resultDic123=[WSC setServiceClass:IDBaseURL serviceUrl:IDServiceURl dataDic:nil isPOST:NO];
    NSLog(@"resultDic===>%@,",resultDic);
    
}

-(void)abc{
    
    WebServiceClass *WSC = [[WebServiceClass alloc] init];
    NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
    [postDic setObject:@"44.1" forKey:@"north"];
    [postDic setObject:@"-9.9" forKey:@"south"];
    [postDic setObject:@"-22.4" forKey:@"east"];
    [postDic setObject:@"55.2" forKey:@"west"];
    [postDic setObject:@"lang" forKey:@"lang"];
    [postDic setObject:@"demo" forKey:@"username"];
    
    [WSC getServerResponseForUrl:postDic serviceURL:IDServiceURl isPOST:YES withCallback:^(BOOL success, NSDictionary *response, NSError *error) {
         if (success)
         {
             NSLog(@"result===>%@",response);
             // Use your response NSDictionary object
         }
         else
         {
             NSLog(@"error===>%@",error.description);
             // Display you error NSError object
         }
     }];
}

*/

-(void)addDatePickerWithToolBar:(int)tag{
    
    CGFloat orgW=self.view.frame.size.width;
    CGFloat orgPVH=180;
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height-orgPVH-44,orgW,44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height-orgPVH,orgW,orgPVH);
    
    //pickerView
    datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height+44,orgW, orgPVH)];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(pickerAction:) forControlEvents:UIControlEventValueChanged]; // method to respond to changes in the picker value
    
    //Set Date
    [datePicker setDate:[NSDate date]];
    datePicker.backgroundColor=[UIColor groupTableViewBackgroundColor];
    datePicker.tag=tag;
    [self.view addSubview:datePicker];
    
    //toolBar
    CGFloat tbH;
    tbH=44;
    
    toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height,orgW, 44)];
    
    UIBarButtonItem *IDLeftTBBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    IDLeftTBBtn.tintColor=[UIColor grayColor];
    IDLeftTBBtn.tag=tag;
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    
    UIBarButtonItem *IDRightTBBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(IDRightTBBtnAction:)];
    IDRightTBBtn.tintColor=[UIColor whiteColor];
    IDRightTBBtn.tag=tag;
    
    [toolBar setItems:[[NSArray alloc] initWithObjects:IDLeftTBBtn,spacer,IDRightTBBtn,nil]];
    [toolBar setBarStyle:UIBarStyleBlackTranslucent];
    [toolBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
    toolBar.tintColor=[UIColor redColor];
    [self.view addSubview:toolBar];
    
    [UIView beginAnimations:@"MoveIn" context:nil];
    toolBar.frame = toolbarTargetFrame;
    datePicker.frame = datePickerTargetFrame;
    [UIView commitAnimations];
}

-(void)IDLeftTBBtnAction:(UIBarButtonItem*)sender
{
    NSDate *chosen = [datePicker date];
    [datePicker removeFromSuperview];
    [toolBar removeFromSuperview];
    NSLog(@"%@",chosen);
}

-(void)IDRightTBBtnAction:(UIBarButtonItem*)sender
{
//    NSDateFormatter *dd,*mm,*yy= [[NSDateFormatter alloc] init];
//    [dd setDateFormat:@"dd"];
//    [mm setDateFormat:@"MM"];
//    [yy setDateFormat:@"yy"];
//    
//    
//    NSLog(@"sel date==>%@",[dd stringFromDate:datePicker.date]);
//    NSLog(@"sel date==>%@",[mm stringFromDate:datePicker.date]);
//    NSLog(@"sel date==>%@",[yy stringFromDate:datePicker.date]);
    
    if (sender.tag==1001) {
        
        pickupDate=datePicker.date;
        DPView1Lbldd.text=[NSString stringWithFormat:@"%@",datePicker.date];
        //DPView1Lbldd.text=[NSString stringWithFormat:@"%@",datePicker.date];
//        DPView1Lbldd.text=[NSString stringWithFormat:@"%@",[dd stringFromDate:datePicker.date]];
//        DPView1Lblmm.text=[NSString stringWithFormat:@"%@",[mm stringFromDate:datePicker.date]];
    }else if (sender.tag==1002){
        dropDate=datePicker.date;
         DPView2Lbldd.text=[NSString stringWithFormat:@"%@",datePicker.date];
        
//        DPView2Lbldd.text=[NSString stringWithFormat:@"%@",[dd stringFromDate:datePicker.date]];
//        DPView2Lblmm.text=[NSString stringWithFormat:@"%@",[mm stringFromDate:datePicker.date]];
    }

    CGFloat orgW=self.view.frame.size.width;
    CGFloat orgPVH=180;
    
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height, orgW, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height+44, orgW, orgPVH);
    [UIView beginAnimations:@"MoveOut" context:nil];
    datePicker.frame = datePickerTargetFrame;
    toolBar.frame = toolbarTargetFrame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeViews:)];
    [UIView commitAnimations];
}

- (void)removeViews:(id)object {
    [datePicker removeFromSuperview];
    [datePicker removeFromSuperview];
}


- (IBAction)pickerAction:(UIDatePicker*)sender
{
    datePicker.date=sender.date;
}




/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"searchTaxi"]) {
        
        
        WebServiceClass *WSC = [[WebServiceClass alloc] init];
        NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
        [postDic setObject:@"32460" forKey:@"cityIds"];
        [postDic setObject:@"2" forKey:@"tripType"];
        [postDic setObject:@"30-10-2015" forKey:@"pickupDate"];
        [postDic setObject:@"30-10-2015" forKey:@"dropDate"];
        [postDic setObject:@"32460" forKey:@"regionIds"];
        [postDic setObject:@"8" forKey:@"hours"];
        
        [WSC getServerResponseForUrl:postDic serviceURL:IDSearchTaxi isPOST:YES withCallback:^(BOOL success, NSDictionary *response, NSError *error) {
            if (success)
            {
                NSLog(@"result===>%@",response);
                CabListView *clv = segue.destinationViewController;
                clv.cabList=@"hello";
            }
            else
            {
                NSLog(@"error===>%@",error.description);
                // Display you error NSError object
            }
        }];
        
        
//        if([pickupDate compare:dropDate] != NSOrderedAscending)
//        {
//            [self alertWithText:error message:invalidDate];
//            return;
//        }else{
//            WebServiceClass *WSC = [[WebServiceClass alloc] init];
//            NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
//            [postDic setObject:@"32460" forKey:@"cityIds"];
//            [postDic setObject:@"2" forKey:@"tripType"];
//            [postDic setObject:@"29-10-2015" forKey:@"pickupDate"];
//            [postDic setObject:@"29-10-2015" forKey:@"dropDate"];
//            [postDic setObject:@"32460" forKey:@"regionIds"];
//            [postDic setObject:@"8" forKey:@"hours"];
//            
//            [WSC getServerResponseForUrl:postDic serviceURL:IDSearchTaxi isPOST:YES withCallback:^(BOOL success, NSDictionary *response, NSError *error) {
//                if (success)
//                {
//                    NSLog(@"result===>%@",response);
//                    CabListView *clv = segue.destinationViewController;
//                    clv.cabList=@"hello";
//                    
//                    
//                    [self.navigationController pushViewController:clv animated:YES];
//                }
//                else
//                {
//                    NSLog(@"error===>%@",error.description);
//                    // Display you error NSError object
//                }
//            }];
//        }
    }
}
 */


/*

-(void)showPopup
{
    popSuperView=[[UIView alloc]init];
    popSuperView.frame=CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height);
    popSuperView.alpha=0.2;
    popSuperView.backgroundColor=[UIColor blackColor];
    
    [UIView animateWithDuration:0.75 animations:^{
        
        popSuperView.alpha=0.5;
    }];
    [self.view addSubview:popSuperView];
    
    popWindowView=[[UIView alloc]init];
    float popViewW=[self percentVal:80 value:popSuperView.frame.size.width];
    float popViewH=120;
    float popViewX=[self percentVal:10 value:popSuperView.frame.size.width];
    float popViewY=(popSuperView.frame.size.height/2)-(popViewH/2);
    popWindowView.layer.cornerRadius=5.0f;
    // popWindowView.alpha=1.0;
    popWindowView.backgroundColor=[UIColor whiteColor];
    popWindowView.frame=CGRectMake(popViewX,popViewY,popViewW,popViewH);
    [self.view addSubview:popWindowView];
    
    popWindowView.frame=CGRectMake(popViewX,popViewY,popViewW,popViewH);
    
    
    
    popLabel=[[UILabel alloc]init];
    float popLabelW=popViewW;
    float popLabelH=[self percentVal:35 value:popWindowView.frame.size.height];
    
    float popLabelX=0;
    float popLabelY=[self percentVal:10 value:popWindowView.frame.size.height];
    
    popLabel.textAlignment = NSTextAlignmentCenter;
    popLabel.numberOfLines=2;
    [popLabel setText:@"Select Range from your Current Location"];
    [popLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [popLabel setTextColor:[UIColor blackColor]];
    popLabel.frame=CGRectMake(popLabelX,popLabelY,popLabelW,popLabelH);
    [popWindowView addSubview:popLabel];
    
    
    
    for (int i=0; i < rangeArray.count; i++)
    {
        btn=[[UIButton alloc]init];
        
        float xVal=[self percentVal:80 value:popViewW];
        float btnW=xVal/rangeArray.count;
        float btnH=[self percentVal:25 value:popWindowView.frame.size.height];
        
        float btnXW=(popViewW-xVal)/(rangeArray.count+1);
        float btnX=(i==0?btnXW:(btnXW*(i+1))+btnW*i);
        //float btnY=(popViewH/2)-(btnH/2);
        float btnY=popLabelY+popLabelH+popLabelY;
        //btn.titleLabel.text=[dirctionArray objectAtIndex:i];
        btn.tag=i;
        //057254
        //064481
        
        btn.backgroundColor=[self colorWithHexString:@"064481"];
        btn.frame=CGRectMake(btnX,btnY,btnW,btnH);
        btn.layer.cornerRadius=5.0f;
        NSString *btnTitle=[rangeArray objectAtIndex:i];
        btnTitle=[btnTitle stringByAppendingString:@" Miles"];
        [btn setTitle:btnTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClickedPopUp:) forControlEvents:UIControlEventTouchUpInside];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [popWindowView addSubview:btn];
    }
}

 
 */




-(void)showPopPicker
{
//    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    PopPickerView *PPV =[storyboard instantiateViewControllerWithIdentifier:@"PopPickerView"];
//    
//    [self presentViewController:PPV animated:YES completion:nil];
//    
//    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"PopPickerView"];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:YES completion:nil];
    
    
    
//    CGRect popPickerCord = CGRectMake(0,100,320,400);
//    [UIView beginAnimations:@"MoveIn" context:nil];
//    popView.frame=popPickerCord;
//    [UIView commitAnimations];
}

-(void)callService{
    
    WebServiceClass *WSC = [[WebServiceClass alloc] init];
    NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
    
    [postDic setObject:@"32460" forKey:@"cityIds"];
    [postDic setObject:@"2" forKey:@"tripType"];
    [postDic setObject:@"05-11-2015" forKey:@"pickupDate"];
    [postDic setObject:@"05-11-2015" forKey:@"dropDate"];
    [postDic setObject:@"32460" forKey:@"regionIds"];
    [postDic setObject:@"8" forKey:@"hours"];
    
    [WSC getServerResponseForUrl:postDic serviceURL:IDSearchTaxi isPOST:YES withCallback:^(BOOL success, NSDictionary *response, NSError *error) {
        if (success) {
            cabList=[[[response valueForKey:@"result"] valueForKey:@"results"] valueForKey:@"taxis"];
            
    CabListView *cdv = [self.storyboard instantiateViewControllerWithIdentifier:@"CabListView"];
    cdv.cabList=cabList;
    [IDLoader hideFromView:self.view animated:YES];
            
    
    [self.navigationController pushViewController:cdv animated:YES];
            
//            dispatch_async (dispatch_get_main_queue(), ^{
//
//            });
            
        }else{
            NSLog(@"error===>%@",error.description);
        }
    }];
}
@end
