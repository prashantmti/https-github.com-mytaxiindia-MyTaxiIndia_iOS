//
//  PopPickerView.m
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/31/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import "PopPickerView.h"

@interface PopPickerView ()

@end

@implementation PopPickerView
@synthesize seatingCapacity,selectedValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"value==>%@",seatingCapacity);
    
    
    availabilityArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 1; i <= 10; i++)
        [availabilityArray addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - pickerView delegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [availabilityArray count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [availabilityArray objectAtIndex:row];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    index =row;
}


-(IBAction)close:(id)sender{
    NSInteger selectedAvailability=[[availabilityArray objectAtIndex:index] integerValue];
    
    if (selectedAvailability>[seatingCapacity integerValue])
    {
        [self alertWithText:@"" message:@"Not Available"];
    }else{
        // for pick date
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"HH:mm"]; //24hr time format
        NSString *dateString = [outputFormatter stringFromDate:datePicker.date];
        
        
        NSDictionary *postParmsDic;
        [postParmsDic setValue:[NSString stringWithFormat:@"%ld",(long)selectedAvailability] forKey:@"noOfCars"];
        [postParmsDic setValue:dateString forKey:@"pickTime"];
        
        [self dismissViewControllerAnimated:YES completion:^
         {
             [[NSNotificationCenter defaultCenter] postNotificationName:@"pushToSingle" object:nil userInfo:postParmsDic];
         }];
    }
}


-(void)displayNewVC
{
    PopPickerView *PPV = [[PopPickerView alloc] init];
    PPV.view.frame=CGRectMake(PPV.view.frame.origin.x,PPV.view.frame.origin.y, PPV.view.frame.size.width, PPV.view.frame.size.height);
    
    PPV.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [self.view addSubview:PPV.view];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        PPV.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished){
        // do something once the animation finishes, put it here
    }];
}
@end
