//
//  TCDownLoadXML.m
//  TCApp
//
//  Created by Frank McAuley on 4/15/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import "TCDownLoadXML.h"


@implementation TCDownLoadXML

@synthesize fileDownloaded=_fileDownloaded;
@synthesize delegate=_delegate;


- (void)dealloc {
    
    [_fileDownloaded release];
        
    [super dealloc];
}

@end
