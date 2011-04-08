//
//  TCAppAppDelegate_iPhone.h
//  TCApp
//
//  Created by Frank McAuley on 2/18/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCAppAppDelegate.h"


@interface TCAppAppDelegate_iPhone : TCAppAppDelegate {
@private
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;


@end
