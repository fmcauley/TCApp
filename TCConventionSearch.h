//
//  TCConventionSearch.h
//  TCApp
//
//  Created by Frank McAuley on 3/12/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCDownLoadXML.h"


@interface TCConventionSearch : UIViewController <UITableViewDelegate,UITableViewDataSource,TCDownLoadXMLDelegate> {
    
    UITableView* _tableView;
    NSData* _fileDownLoadData; //delgate call back data
}

@property(nonatomic, retain) TCDownLoadXML *tcDownLoad;
@property(nonatomic, retain) IBOutlet UITableView* tableView;

@property(nonatomic, retain) NSData* fileDownLoadData; //delegate call back data;

@end
