//
//  TCDownLoadXML.h
//  TCApp
//
//  Created by Frank McAuley on 4/15/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TCDownLoadXMLDelegate;

@interface TCDownLoadXML : NSObject {
    
    NSData* _fileDownloaded;
    id <TCDownLoadXMLDelegate> _delegate;
}

@property (nonatomic, retain) NSData* fileDownloaded;
@property (assign) id <TCDownLoadXMLDelegate> delegate;

@end

@protocol TCDownLoadXMLDelegate

- (void)tcDownLoadXML:(TCDownLoadXML*)sender didDownLoadData:(NSData*)data;

@end
