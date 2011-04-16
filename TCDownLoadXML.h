//
//  TCDownLoadXML.h
//  TattooConventionsApp
//
//  Created by Frank McAuley on 2/12/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TCDownLoadXMLDelegate;

@interface TCDownLoadXML : NSObject 
{
@private
    
    id <TCDownLoadXMLDelegate> _delegate;
    NSData* _fileDownloaded;
}

@property(assign) id <TCDownLoadXMLDelegate> delegate;
@property(nonatomic, retain) NSData* fileDownloaded;


-(void)downloadAndProcess;
-(id)initWithDownLoad;

@end

@protocol TCDownLoadXMLDelegate

- (void)tcDownLoadXML:(TCDownLoadXML*)sender didDownLoadData:(NSData*)data;

@end