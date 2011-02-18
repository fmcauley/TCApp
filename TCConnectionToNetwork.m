//
//  TCConnectionToNetwork.m
//  TattooConventionsApp
//
//  Created by Frank McAuley on 2/12/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import "TCConnectionToNetwork.h"
#import <SystemConfiguration/SCNetworkReachability.h>
#include <sys/types.h>
#include <sys/sysctl.h>

#define EXTERNAL_HOST @"google.com"

@implementation UIDevice (DeviceConnectivity)

+(BOOL)cellularConnected{// EDGE or GPRS
	SCNetworkReachabilityFlags    flags = 0;
	SCNetworkReachabilityRef      netReachability = NULL;
	
	netReachability     = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [EXTERNAL_HOST UTF8String]);
	if(netReachability){
		SCNetworkReachabilityGetFlags(netReachability, &flags);
		CFRelease(netReachability);
	}
	if(flags & kSCNetworkReachabilityFlagsIsWWAN){
		return YES;
	}
	return NO;
}

+(BOOL)wiFiConnected{
	if([self cellularConnected]){
		return NO;
	}
	return [self networkConnected];
}

+(BOOL)networkConnected{
	SCNetworkReachabilityFlags     flags = 0;
	SCNetworkReachabilityRef       netReachability = NULL;
	BOOL                           retrievedFlags = NO;
	
	netReachability     = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [EXTERNAL_HOST UTF8String]);
	if(netReachability){
		retrievedFlags      = SCNetworkReachabilityGetFlags(netReachability, &flags);
		CFRelease(netReachability);
	}
	if (!retrievedFlags || !flags){
		return NO;
	}
	return YES;
}

- (NSString *)machine
{
	size_t size;
	
    // Set 'oldp' parameter to NULL to get the size of the data
    // returned so we can allocate appropriate amount of space
	sysctlbyname("hw.machine", NULL, &size, NULL, 0); 
	
    // Allocate the space to store name
	char *name = malloc(size);
	
    // Get the platform name
	sysctlbyname("hw.machine", name, &size, NULL, 0);
	
    // Place name into a string
	NSString *machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
	
    // Done with this
	free(name);
	
	return machine;
}


@end
