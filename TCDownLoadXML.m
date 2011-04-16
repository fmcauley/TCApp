//
//  TCDownLoadXML.m
//  TCApp
//
//  Created by Frank McAuley on 4/15/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#define kURL        @"http://www.tattooconventionsnow.com/iphonexml.cfm?requesttimeout=10000"
#define kXMLFile    @"xmlFile"

#import "TCDownLoadXML.h"


@implementation TCDownLoadXML

@synthesize fileDownloaded=_fileDownloaded;
@synthesize delegate=_delegate;


- (void)dealloc {
    
    [_fileDownloaded release];
        
    [super dealloc];
}

-(id)initWithDownLoad{
    
    if ((self = [super init])){
        return self;
    }
    return nil;
}

-(void)downloadAndProcess{
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:kURL]];
    NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    if (con) {
        NSMutableData *data = [[NSMutableData alloc]init];
        self.fileDownloaded = data;
        [data release];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [self.fileDownloaded setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.fileDownloaded appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [connection release];
    self.fileDownloaded = nil;
    NSLog(@"Error retrieving data for url %@, error was: %@",
          [error localizedDescription],[[error userInfo]
                                        objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection{
    
    //setup the delegate method
    [self.delegate tcDownLoadXML:self didDownLoadData:self.fileDownloaded]; 
     
    [connection release];
    
}


@end
