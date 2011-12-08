//
//  LDTViewController.m
//  ldtrkpoc1
//
//  Created by Shane Zatezalo on 12/6/11.
//  Copyright (c) 2011 Lottadot LLC. All rights reserved.
//

#import "LDTViewController.h"
#import "LDTWidget.h"

@interface LDTViewController ()
- (void)loadWidgets;
@end;

@implementation LDTViewController

@synthesize _tableView;

- (void)loadWidgets {
    // Load the object model via RestKit	
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    objectManager.client.baseURL = LDTHOSTNAME;
    [objectManager loadObjectsAtResourcePath:@"/widgets" delegate:self block:^(RKObjectLoader* loader) {
        if ([objectManager.acceptMIMEType isEqualToString:RKMIMETypeJSON]) {
            loader.objectMapping = [objectManager.mappingProvider objectMappingForClass:[LDTWidget class]];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Lottadot Widgets";
	[self loadWidgets];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark RKObjectLoaderDelegate methods

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    NSLog(@"Loaded payload: %@", [response bodyAsString]);
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
	NSLog(@"Loaded widgets: %@", objects);    
	widgets = objects;
	[_tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	NSLog(@"Hit error: %@", error);
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [widgets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"CellIdentifier";

	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	if (nil == cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	}
	cell.textLabel.text = [[widgets objectAtIndex:indexPath.row] title];
	return cell;
}

#pragma mark Action methods

-(IBAction)newButtonClicked:(id)sender {
    LDTWidget *newWidget = [LDTWidget new];
    newWidget.title = @"some title";
    newWidget.summary = @"some summary";
    
    // Send a POST to /widgets to create the remote instance
    [ [RKObjectManager sharedManager] postObject:newWidget delegate:self];

    
}

@end
