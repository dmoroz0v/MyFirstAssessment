//
//  ImageDescViewController.m
//  testtest
//
//  Created by denis morozov on 20.08.12.
//  Copyright (c) 2012 SWS. All rights reserved.
//

#import "ImageDescViewController.h"

@implementation ImageDescViewController

- (id)initWithConf: (NSDictionary*) conf
{
    self = [super init];
    if (self) {
        // Custom initialization
		UIImageView *imageView;
		{
			NSArray *img = [[conf objectForKey: @"img"] componentsSeparatedByString:@"."];
			
			imageView = [[[UIImageView alloc] init] autorelease];
			UIImage *image = [[[UIImage alloc] initWithContentsOfFile: [[NSBundle mainBundle] pathForResource:[img objectAtIndex: 0] ofType:[img objectAtIndex: 1] ]] autorelease];
			imageView.image = image;
			imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, image.size.height * self.view.frame.size.width / image.size.width);
			
			[self.view addSubview: imageView];
		}
		
		{
			UITextView *textView = [[[UITextView alloc] init] autorelease];
			textView.frame = CGRectMake(0, imageView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
			textView.text = NSLocalizedString([conf objectForKey: @"desc"], @"");
			
			textView.delegate = self;
			
			[self.view addSubview: textView];
		}
		
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

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
	if ([text compare:@"\n"] == 0)
	{
		[textView endEditing: YES];
	}
	return YES;
}

- (void) dealloc
{
	[super dealloc];
}

@end
