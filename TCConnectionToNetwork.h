//
//  TCConnectionToNetwork.h
//  TattooConventionsApp
//
//  Created by Frank McAuley on 2/12/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SCNetworkReachability.h>

//add SystemConfiguration Framework

@interface UIDevice (DeviceConnectivity)

+(BOOL)cellularConnected; 
+(BOOL)wiFiConnected;
+(BOOL)networkConnected; 
-(NSString *)machine;


@end
