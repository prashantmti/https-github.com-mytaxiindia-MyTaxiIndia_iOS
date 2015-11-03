//
//  UserDefault.m
//  MyTaxiIndia
//
//  Created by mytaxiit on 10/23/15.
//  Copyright © 2015 mytaxiit. All rights reserved.
//

#import "UserDefault.h"

@implementation UserDefault


//  for user name
- (NSString *)userName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
}

- (void)setUserName:(NSString *)userName
{
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


//  for user email
- (NSString *)userEmail
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"];
}

- (void)setUserEmail:(NSString *)userEmail
{
    [[NSUserDefaults standardUserDefaults] setObject:userEmail forKey:@"userEmail"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//  for user mobile no
- (NSString *)userMobileNo
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"userMobileNo"];
}

- (void)setUserMobileNo:(NSString *)userMobileNo
{
    [[NSUserDefaults standardUserDefaults] setObject:userMobileNo forKey:@"userMobileNo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//  for user addresss
- (NSString *)userAddress
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"userAddress"];
}

- (void)setUserAddress:(NSString *)userAddress
{
    [[NSUserDefaults standardUserDefaults] setObject:userAddress forKey:@"userAddress"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
