//
//  myTableCell.m
//  testtest
//
//  Created by denis morozov on 21.08.12.
//  Copyright (c) 2012 SWS. All rights reserved.
//

#import "myTableCell.h"

@implementation myTableCellController

@synthesize label;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ( (self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil]) )
	{
		
	}
	return self;
}

- (void) viewDidLoad
{
	[super viewDidLoad];
}

- (void) dealloc
{
	self.label = nil;
	[super dealloc];
}

@end

@implementation myTableCell

@synthesize label;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier nibFile: (NSString *) nibFile{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		mtcc = [[myTableCellController alloc] initWithNibName: nibFile bundle: nil];
		mtcc.view.frame = CGRectMake(0, 0, mtcc.view.frame.size.width, self.frame.size.height);
		[self addSubview: mtcc.view];
		self.label = mtcc.label;
		self.label.frame = CGRectMake(0, 0, self.label.frame.size.width, self.frame.size.height);
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		// custom init
		self.label = [[[UILabel alloc] initWithFrame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)] autorelease];
		[self addSubview: label];
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (void) dealloc
{
	self.label = nil;
	[mtcc release];
	[super dealloc];
}

@end
