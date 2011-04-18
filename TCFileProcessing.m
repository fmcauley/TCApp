//
//  TCFileProcessing.m
//  TCApp
//
//  Created by Frank McAuley on 4/16/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import "TCFileProcessing.h"


@implementation TCFileProcessing

@synthesize downloadedData=_downloadedData;

- (void) processTheDownLoadedFileIntoCoreData:(NSData*)data {
    
    self.downloadedData = data;
}

- (void)dealloc {
    
    [_downloadedData release];
    [super dealloc];
}

@end
