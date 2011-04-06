//
//  TCWebView.m
//  TCApp
//
//  Created by Frank McAuley on 4/5/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import "TCWebView.h"

@interface TCWebView () {}
@end

@implementation TCWebView

@synthesize web;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [web release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //setup the tem web view:
    NSString* strURL = @"http://www.apple.com";
    
    //create the url object
    NSURL* url = [NSURL URLWithString:strURL];
    
    //request
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    //loadweb view
    [web loadRequest:request];
    
    
}

- (void)viewDidUnload
{
    self.web = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
