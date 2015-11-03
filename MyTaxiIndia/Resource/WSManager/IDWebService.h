//
//  IDWebService.h
//  IDVersion:1.0
//  Copyright (c) 2014 ID Developer Team
//  By Prashant
//

#import <Foundation/Foundation.h>

@interface IDWebService : NSObject

//Set Base URL
extern NSString *const IDBaseURL;

//set Service URL
extern NSString *const IDServiceURl;

extern NSString *const IDSearchTaxi;

extern NSString *const IDCabReview;


//http://192.168.1.10/ws//v1/booking/review?cityIds=32460&tripType=2&noOfCars=1&pickupDate=29-10-2015%2019:40&vehicleCategory=FAMILY&regionIds=32460&hours=8

@end
