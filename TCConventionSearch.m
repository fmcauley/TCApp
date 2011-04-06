//
//  TCConventionSearch.m
//  TCApp
//
//  Created by Frank McAuley on 3/12/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//

#import "TCConventionSearch.h"
#import "TCDownLoadXML.h"
#import "TCWebView.h"

@interface TCConventionSearch (){@private}
@property(nonatomic, retain)NSArray *tableName;
@property(nonatomic, retain)NSArray *tableDate;
@property(nonatomic, retain)NSArray *tableAddress;
@end

@implementation TCConventionSearch

@synthesize tcDownLoad;
@synthesize tableName;
@synthesize tableDate;
@synthesize tableAddress;
@synthesize tableView;

/*- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}*/

- (void)dealloc
{
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

    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TattooConventions_Background_IPHONE_LOAD_480x320"]];
    

    [self.tableView reloadData];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

-(void)reloadDataAfterLoad {
    self.tableName = [tcDownLoad.nameOfConventions valueForKey:@"nodeContent"];
   // self.tableName = tcDownLoad.nameOfConventions;
    self.tableDate = tcDownLoad.dateOfConventions;
    self.tableAddress = [tcDownLoad.addressOfConventions valueForKey:@"nodeContent"];
    [tcDownLoad release];
    [self.tableView reloadData];
   }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    tcDownLoad = [[TCDownLoadXML alloc]init];
    [tcDownLoad downloadAndProcess];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadDataAfterLoad) name:@"notificationName" object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.tableName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text	= [self.tableName objectAtIndex:indexPath.row];
    cell.detailTextLabel.text	= [self.tableDate objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"icon-small-50.png"]; //this is a place holder for some other images that I will use.
   
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TCWebView* webViewController = [[TCWebView alloc]initWithNibName:@"TCWebView" bundle:nil];
   // [self presentModalViewController:webViewController animated:YES];
    [self.navigationController pushViewController:webViewController animated:YES];
    [webViewController release];
}

@end
