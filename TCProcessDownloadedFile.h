//
//  TCProcessDownloadedFile.h
//  TCApp
//
//  Created by Frank McAuley on 4/10/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TCProcessDownloadedFile : NSObject {
    
    
}

+ (TCProcessDownloadedFile*)returnedBuitTCProcessDownloadFile;

- (void)processFileAfterDownload:(NSData*)data;

@end
