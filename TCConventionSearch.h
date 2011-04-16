//
//  TCConventionSearch.h
//  TCApp
//
//  Created by Frank McAuley on 3/12/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TCDownLoadXML;


@interface TCConventionSearch : UIViewController <UITableViewDelegate,UITableViewDataSource> {
    
    UITableView* _tableView;
    
}

@property(nonatomic, retain) TCDownLoadXML *tcDownLoad;
@property(nonatomic, retain) IBOutlet UITableView* tableView;

@end
