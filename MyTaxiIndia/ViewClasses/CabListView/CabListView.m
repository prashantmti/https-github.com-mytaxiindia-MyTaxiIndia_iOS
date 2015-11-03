//
//  CabListView.m
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/27/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import "CabListView.h"

@interface CabListView ()

@end

@implementation CabListView
@synthesize cabList,TBcabList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"TB count==>%lu",(unsigned long)cabList.count);
    return cabList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CabListViewCell";
    
    CabListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[CabListViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
//    @property (strong, nonatomic) IBOutlet UIImageView *cabIMG;
//    @property (strong, nonatomic) IBOutlet UILabel *cabName;
//    @property (strong, nonatomic) IBOutlet UILabel *availableSeat;
//    @property (strong, nonatomic) IBOutlet UILabel *totalHrs;
//    @property (strong, nonatomic) IBOutlet UILabel *baseAmount;
//    @property (strong, nonatomic) IBOutlet UILabel *totalAmount;
    
//    cell.cabName.text=[cabList valueForKey:@"category"];
//    cell.availableSeat.text=[cabList valueForKey:@"seatingCapacity"];
//    cell.totalHrs.text=[cabList valueForKey:@"totalHrs"];
//    cell.baseAmount.text=[[cabList valueForKey:@"tariff"] valueForKey:@"totalAmount"];
//    cell.totalHrs.text=[[cabList valueForKey:@"tariff"] valueForKey:@"totalAmount"];
//    
//
    NSString *cabName,*seatingCapacity,*baseAmount,*totalHrs;
    //NSNumber*seatingCapacity;
    cabName=[[cabList objectAtIndex:indexPath.row] valueForKey:@"category"];
    seatingCapacity=[NSString stringWithFormat:@"%@",[[cabList objectAtIndex:indexPath.row] valueForKey:@"seatingCapacity"]];
    totalHrs=[NSString stringWithFormat:@"%@",[[[cabList objectAtIndex:indexPath.row] valueForKey:@"tariff"] valueForKey:@"totalAmount"]];
    baseAmount=[NSString stringWithFormat:@"%@",[[[cabList objectAtIndex:indexPath.row] valueForKey:@"tariff"] valueForKey:@"totalAmount"]];

    if ([cabName isKindOfClass:[NSNull class]])
    {
        cabName=@"";
    }else if ([seatingCapacity isKindOfClass:[NSNull class]] || [seatingCapacity isEqual:@"<null>"])
    {
        seatingCapacity=@"0";
    }
    else if ([totalHrs isKindOfClass:[NSNull class]] || [totalHrs isEqual:@"<null>"])
    {
        totalHrs=@"";
    }
    else if ([baseAmount isKindOfClass:[NSNull class]] || [baseAmount isEqual:@"<null>"])
    {
        baseAmount=@"";
    }

    cell.cabName.text=cabName;
    cell.availableSeat.text=[NSString stringWithFormat:@"%@",seatingCapacity];
    cell.totalHrs.text=totalHrs;
    cell.baseAmount.text=baseAmount;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showPopPicker];
}

//
//-(void)callService{
//    
//    //http://192.168.1.5/ws/v1/search/searchTaxiWithParams?cityIds=32460,47646&tripType=1&pickupDate=30-10-2015&dropDate=30-10-2015&regionIds=32460,47646&hours=8
//    
//    WebServiceClass *WSC = [[WebServiceClass alloc] init];
//    NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
//    [postDic setObject:@"32460" forKey:@"cityIds"];
//    [postDic setObject:@"2" forKey:@"tripType"];
//    [postDic setObject:@"30-10-2015" forKey:@"pickupDate"];
//    [postDic setObject:@"30-10-2015" forKey:@"dropDate"];
//    [postDic setObject:@"32460" forKey:@"regionIds"];
//    [postDic setObject:@"8" forKey:@"hours"];
//    
//    [WSC getServerResponseForUrl:postDic serviceURL:IDSearchTaxi isPOST:YES withCallback:^(BOOL success, NSDictionary *response, NSError *error) {
//        if (success)
//        {
//            cabList=[[[response valueForKey:@"result"] valueForKey:@"results"] valueForKey:@"taxis"];
//            
//            [TBcabList reloadData];
//        }
//        else
//        {
//            NSLog(@"error===>%@",error.description);
//            // Display you error NSError object
//        }
//    }];
//}


-(void)showPopPicker
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PopPickerView *vc = [storyboard instantiateViewControllerWithIdentifier:@"PopPickerView"];
    vc.seatingCapacity=@"4";
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)displayNewVC1
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PopPickerView *PPV = [storyboard instantiateViewControllerWithIdentifier:@"PopPickerView"];
    
    PPV.view.frame=CGRectMake(PPV.view.frame.origin.x,PPV.view.frame.origin.y, PPV.view.frame.size.width, PPV.view.frame.size.height);
    
    PPV.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [self.view addSubview:PPV.view];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        PPV.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished){
        // do something once the animation finishes, put it here
    }];
}

-(void)displayNewVC
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PopPickerView *newVC = [storyboard instantiateViewControllerWithIdentifier:@"PopPickerView"];
    
    //PopPickerView *newVC = [[PopPickerView alloc] init];
    
    CGFloat originY = -450;//set originY as you want to display newViewController from the Top to bottom with animation
    //initially set originY out of the Frame of CurrentViewcontroller
    newVC.view.frame = CGRectMake(0, originY, newVC.view.frame.size.width, newVC.view.frame.size.height);
    
    /*Display View With Animation*/
    originY = 300;
    [UIView animateWithDuration:.3 animations:^{
        //set new originY as you want.
        newVC.view.frame = CGRectMake(0, originY, newVC.view.frame.size.width,  newVC.view.frame.size.height);
    } completion:NULL];
    [self.view addSubview:newVC.view];
}





-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToSingle:) name:@"pushToSingle" object:nil];
}

-(void)pushToSingle:(NSNotification *)notis{
    NSDictionary *dict = notis.userInfo;
   // int post_id = [[dict objectForKey:@"post_id"] intValue];
    
    NSLog(@"pushing to single===>%@",dict);
    
    WebServiceClass *WSC = [[WebServiceClass alloc] init];
    NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
    
    [postDic setObject:@"32460" forKey:@"cityIds"];
    [postDic setObject:@"2" forKey:@"tripType"];
    [postDic setObject:@"05-11-2015" forKey:@"noOfCars"];
    [postDic setObject:@"05-11-2015" forKey:@"pickupDate"];
    [postDic setObject:@"32460" forKey:@"vehicleCategory"];
    [postDic setObject:@"8" forKey:@"regionIds"];
    [postDic setObject:@"8" forKey:@"hours"];
    
    
    [WSC getServerResponseForUrl:postDic serviceURL:IDCabReview isPOST:YES withCallback:^(BOOL success, NSDictionary *response, NSError *error) {
        if (success) {
            cabList=[[[response valueForKey:@"result"] valueForKey:@"results"] valueForKey:@"taxis"];
            
            CabListView *cdv = [self.storyboard instantiateViewControllerWithIdentifier:@"CabListView"];
            cdv.cabList=cabList;
            
            [IDLoader hideFromView:self.view animated:YES];
            
            
            [self.navigationController pushViewController:cdv animated:YES];
        }else{
            NSLog(@"error===>%@",error.description);
        }
    }];
   // http://192.168.1.10/ws//v1/booking/review?cityIds=32460&tripType=2&noOfCars=1&pickupDate=29-10-2015%2019:40&vehicleCategory=FAMILY&regionIds=32460&hours=8
}
@end
