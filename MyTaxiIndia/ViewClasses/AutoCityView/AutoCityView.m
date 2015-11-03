//
//  AutoCityView.m
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/16/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import "AutoCityView.h"

@interface AutoCityView ()


@end

@implementation AutoCityView

@synthesize TBcityList,cityArray,refCityArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    cityArray=[self getLocationArray];
    refCityArray=[cityArray copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return refCityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text=[refCityArray objectAtIndex:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchTaxiView *stv=[[SearchTaxiView alloc]init];
    stv.selectedLocation=[refCityArray objectAtIndex:indexPath.row];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)BTNdismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBarEd
//{
//    UITextField* textField = [self findTextFieldInView:searchBarEd];
//    if (textField) {
//        textField.enablesReturnKeyAutomatically = NO;
//    }
//}


//-(UITextField*)findTextFieldInView:(UIView*)view
//{
//    if ([view isKindOfClass:[UITextField class]]) {
//        return (UITextField*)view;
//    }
//    for (UIView* subview in view.subviews) {
//        UITextField* textField = [self findTextFieldInView:subview];
//        if (textField) {
//            return textField;
//        }
//    }
//    return nil;
//}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //[self callService:searchText];
    if (searchText.length>1)
    {
        [operationQueue cancelAllOperations];
        
        // Create a new NSOperationQueue instance.
        operationQueue = [NSOperationQueue new];
        
        // Create a new NSOperation object using the NSInvocationOperation subclass.
        // Tell it to run the counterTask method.
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                                selector:@selector(myOperation:)
                                                                                  object:searchText];
        // Add the operation to the queue and let it to be executed.
        [operationQueue addOperation:operation];
        
        //from service
    }else
    {
        refCityArray=cityArray;
        [TBcityList reloadData];
    }

}
/*
-(void)myOperation:(id)obj
{
    NSLog(@"obj===>%@",obj);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] %@", obj];
    NSArray *cityResponseArray = [cityArray filteredArrayUsingPredicate:predicate];
    
    WebServiceClass *WSC = [[WebServiceClass alloc] init];
    NSString *url = @"http://192.168.1.19/tms-ws/v1/meta/regionsStartsWith?term=";
    
    NSString * curl=[NSString stringWithFormat:@"%@%@",url,obj];
    [WSC getServerResponseForUrl:curl withCallback:^(BOOL success, NSDictionary *response, NSError *error)
     {
         if (success)
         {
             resultWSDic=[response valueForKey:@"result"];
             //                 NSLog(@"com resultWSDic==>%@",resultWSDic);
             //                 NSLog(@"result==>%@",[resultWSDic valueForKey:@"locality"]);
             
             NSArray *WSResult=[self setLocationArrayWithLocationDicObj:[response valueForKey:@"result"]];
             NSLog(@"WSResult==>%@",WSResult);
             
             // refCityArray=[cityResponseArray arrayByAddingObjectsFromArray:WSResult];
             refCityArray=[NSMutableArray arrayWithArray:WSResult];
             [TBcityList reloadData];
         }
         else
         {
             refCityArray=[NSMutableArray arrayWithArray:cityResponseArray];
             [TBcityList reloadData];
         }
         
         
         if (refCityArray.count==0) {
             NSArray *noDataArray=[NSArray arrayWithObjects:@"No Record",nil];
             refCityArray=[NSMutableArray arrayWithArray: noDataArray];
         }
     }];
}
*/
//if (refCityArray.count==0) {
//    NSArray *noDataArray=[NSArray arrayWithObjects:@"No Record",nil];
//    refCityArray=[NSMutableArray arrayWithArray: noDataArray];
//}

//-(void)callService:(NSString *)params
//{
//    NSMutableDictionary *postDic=[[NSMutableDictionary alloc]init];
//
//    [postDic setObject:parms forKey:@"term"];
//
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
//}


/*
-(NSDictionary*)callService:(NSString*)params
{

    WebServiceClass *WSC = [[WebServiceClass alloc] init];
    NSString *url = @"http://192.168.1.5/ws/v1/meta/regionsStartsWith?term=";
    
    NSString * curl=[NSString stringWithFormat:@"%@%@",url,params];
    //[WSC getServerResponseForUrl:curl withCallback:^(BOOL success, NSDictionary *response, NSError *error)
    
    NSDictionary *dataPrams;
    
    
     
     [WSC getServerResponseForUrl:<#(NSDictionary *)#> isPOST:YES withCallback:^(BOOL success, NSDictionary *response, NSError *error) {
         if (success)
         {
             resultWSDic=response;
             //NSLog(@"result===>%@",response);
            // Use your response NSDictionary object
         }
         else
         {
             resultWSDic=response;
             //NSLog(@"error===>%@",error.description);
             // Display you error NSError object
         }
     }];
    return resultWSDic;
}
*/

-(NSArray*)setLocationArrayWithLocationDicObj:(NSArray*)locationDic
{
    NSDictionary * tempDic;
    NSMutableArray *locationArray=[[NSMutableArray alloc]init];
    
    for (tempDic in locationDic) {
        NSString *locationStr;
        NSString * locality=[tempDic valueForKey:@"locality"];
        NSString * city=[tempDic valueForKey:@"city"];
        NSString * state=[tempDic valueForKey:@"state"];
        NSString * country=[tempDic valueForKey:@"country"];
        locationStr=[NSString stringWithFormat:@"%@, %@, %@, %@",locality,city,state,country];
        [locationArray addObject:locationStr];
    }
    return locationArray;
}
@end
