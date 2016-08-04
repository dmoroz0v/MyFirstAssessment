//
//  RootViewController.m
//  testtest
//
//  Created by denis morozov on 20.08.12.
//  Copyright (c) 2012 SWS. All rights reserved.
//

#import "RootViewController.h"
#import "myViewController.h"

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		myViewController *mc1 = [[myViewController alloc] init];
		mc1.data = [NSArray arrayWithObjects:
					[NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: @"baikal_at_dawn", @"baikal_dawn.jpeg", @"baikal_at_dawn", nil] forKeys: [NSArray arrayWithObjects: @"label", @"img", @"desc", nil]],
					[NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: @"baikal_at_sunset", @"baikal_sunset.jpeg", @"baikal_at_sunset", nil] forKeys: [NSArray arrayWithObjects: @"label", @"img", @"desc", nil]],
					nil];
		
		myViewController *mc2 = [[myViewController alloc] init];
		mc2.data = [NSArray arrayWithObjects:
					[NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: @"chinese_wall", @"chinese_wall.jpeg", @"chinese_wall", nil] forKeys: [NSArray arrayWithObjects: @"label", @"img", @"desc", nil]],
					[NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: @"bronze_dragon", @"bronze_dragon.jpeg", @"bronze_dragon", nil] forKeys: [NSArray arrayWithObjects: @"label", @"img", @"desc", nil]],
					nil];
		
		UINavigationController *nc1 = [[[UINavigationController alloc] initWithRootViewController: mc1] autorelease];
		UINavigationController *nc2 = [[[UINavigationController alloc] initWithRootViewController: mc2] autorelease];
		
		_left_tab_bar_item = [[[UITabBarItem alloc] initWithTitle: NSLocalizedString(@"tab_bar_item_left_label", @"") image: nil tag: 1] autorelease];
		_right_tab_bar_item = [[[UITabBarItem alloc] initWithTitle: NSLocalizedString(@"tab_bar_item_right_label", @"") image: nil tag: 2] autorelease];
		
		nc1.tabBarItem = _left_tab_bar_item;
		nc2.tabBarItem = _right_tab_bar_item;
		
		self.viewControllers = [NSArray arrayWithObjects: nc1, nc2, nil];
    }
    return self;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	NSLog(@"right %i", (item == _right_tab_bar_item));
	NSLog(@"left %i", (item == _left_tab_bar_item));
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	NSLog(@"RootViewController: receive memory warning");

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
