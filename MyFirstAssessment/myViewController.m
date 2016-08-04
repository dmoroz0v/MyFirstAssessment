//
//  myViewController.m
//  testtest
//
//  Created by denis morozov on 20.08.12.
//  Copyright (c) 2012 SWS. All rights reserved.
//

#import "myViewController.h"
#import "ImageDescViewController.h"
#import "myTableCell.h"

@implementation myViewController

@synthesize data;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.data = nil;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	table = (UITableView *)[self.view viewWithTag: 1];
	
	table.dataSource = self;
	table.delegate = self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UINavigationController *nav = (UINavigationController *)self.parentViewController;
	
	int rowIndex = [indexPath row];
	
	ImageDescViewController *imageDesc = [[[ImageDescViewController alloc] initWithConf: [data objectAtIndex: rowIndex]] autorelease];
	
	[nav pushViewController: imageDesc animated:YES];
	
	UIBarButtonItem * backButtonItem = [[[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"back", @"") style: UIBarButtonItemStyleBordered target: nil action: nil] autorelease];
	[self.navigationItem setBackBarButtonItem: backButtonItem];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *myViewControllerCellIdentifier = @"myViewControllerCellIdentifier";
	
	myTableCell *cell = (myTableCell *)[tableView dequeueReusableCellWithIdentifier: myViewControllerCellIdentifier];
    if (cell == nil)
	{
		cell = [[[myTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myViewControllerCellIdentifier nibFile:@"myTableCell"] autorelease];
	}
	
	int rowIndex = [indexPath row];
	
	cell.label.text = NSLocalizedString( [[data objectAtIndex: rowIndex] objectForKey: @"label"] , @"");
	
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (data == nil)
	{
		return 0;
	}
	
	return data.count;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

@end
