//
//  TCProcessDownloadedFile.m
//  TCApp
//
//  Created by Frank McAuley on 4/10/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import "TCProcessDownloadedFile.h"


@implementation TCProcessDownloadedFile



+ (TCProcessDownloadedFile*)returnedBuitTCProcessDownloadFile{
    
    return [[[TCProcessDownloadedFile alloc]init] autorelease];
}

- (void)processFileAfterDownload:(NSData*)data{
    
    //setup NSNotification:
    
 //   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadDataAfterLoad) name:@"notificationName" object:nil];
    
}

@end
