//
//  WebServiceClass.m
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/20/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import "WebServiceClass.h"

@implementation WebServiceClass



void(^getServerResponseForUrlCallback)(BOOL success, NSDictionary *response, NSError *error);

// --------------
- (void)getServerResponseForUrl:(NSDictionary*)dataParams serviceURL:(NSString*)serviceURL isPOST:(BOOL)isPOST withCallback:(ASCompletionBlock)callback
{
    getServerResponseForUrlCallback = callback;

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    //  2
    NSMutableURLRequest *request = [self createUrlRequest:dataParams serviceURL:serviceURL isPOST:isPOST];
    
    dispatch_async (dispatch_get_main_queue(), ^{

   
    //Create task
    NSURLSessionDataTask * dataTask =[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //Handle your response here
        
        if (error) {
            [self onBackendResponse:nil withSuccess:NO error:error];
            NSLog(@"error==>%@",error.description);
        }else
        {
            resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            if (error == nil){
                [self onBackendResponse:resultDic withSuccess:YES error:error];
                NSLog(@"responseDic==>%@",resultDic);
            }
            else{
                [self onBackendResponse:nil withSuccess:NO error:error];
                NSLog(@"JSON Response:%@",error.localizedDescription);
            }
        }
    }];
    [dataTask resume];
         });
}

// --------------
- (void)onBackendResponse:(NSDictionary *)response withSuccess:(BOOL)success error:(NSError *)error
{
    dispatch_async (dispatch_get_main_queue(), ^{
        getServerResponseForUrlCallback(success, response, error);
    });
}

-(NSMutableURLRequest *)createUrlRequest:(NSDictionary *)dataParams serviceURL:(NSString*)serviceURL isPOST:(BOOL)isPOST
{
    NSURL *requestURL;
    NSMutableURLRequest *request;
    
    NSMutableString *urlStr=[[NSMutableString alloc]initWithString:@""];
    
    if (isPOST) {
        [urlStr appendFormat:@"%@%@",IDBaseURL,serviceURL];
    }else
    {
        NSString * makeDicStr=[self makeKeyUsingDictionary:dataParams];
        [urlStr appendFormat:@"%@%@?%@",IDBaseURL,serviceURL,makeDicStr];
    }

    requestURL= [NSURL URLWithString:[urlStr stringByRemovingPercentEncoding]];
    NSLog(@"WS requestURL==>%@",requestURL);
    
    request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
    
    if (isPOST) {
        NSString *params = [self makeKeyUsingDictionary:dataParams];
        NSLog(@"params===>%@",params);
        [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        request.HTTPMethod = @"POST";
    }
    return request;
}

-(NSMutableString*) makeKeyUsingDictionary:(NSDictionary*)SetDataDic
{
    NSMutableString *ps;   //parameter string
    ps=[[NSMutableString alloc]initWithString:@""];
    NSArray *dicKeyArray = [SetDataDic allKeys];
    
    if (dicKeyArray.count!=0)
    {
        int i=0;
        for (NSString *key in dicKeyArray)
        {
            if(i == 0){
                [ps appendFormat:@"%@=%@",key,[SetDataDic objectForKey:key]];
            }
            else{
                [ps appendFormat:@"&%@=%@",key,[SetDataDic objectForKey:key]];
            }
            i++;
        }
    }
    return ps;
}
@end
