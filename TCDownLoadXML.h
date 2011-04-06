//
//  TCDownLoadXML.h
//  TattooConventionsApp
//
//  Created by Frank McAuley on 2/12/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TCDownLoadXML : NSObject  {}

@property(nonatomic, retain)NSArray *nameOfConventions;
@property(nonatomic, retain)NSArray *addressOfConventions;
@property(nonatomic, retain)NSMutableArray *dateOfConventions;
@property(nonatomic, retain)NSArray *urlOfConventions;
@property(nonatomic, retain)NSArray *artistsOfConventions;

-(void)downloadAndProcess;

-(id)initWithDownLoad;

-(NSArray *)returnConventionsNamesForTableViewWithData:(NSData *)data;
@end
