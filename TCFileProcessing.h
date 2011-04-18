//
//  TCFileProcessing.h
//  TCApp
//
//  Created by Frank McAuley on 4/16/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TCFileProcessing : NSObject {
    
    NSData* _downloadedData;
    
}

@property(nonatomic, retain) NSData* downloadedData;

- (void) processTheDownLoadedFileIntoCoreData:(NSData*)data;
@end
