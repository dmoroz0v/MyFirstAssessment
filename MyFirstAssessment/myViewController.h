//
//  myViewController.h
//  testtest
//
//  Created by denis morozov on 20.08.12.
//  Copyright (c) 2012 SWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
	NSArray *data;
	UITableView *table;
}

@property (nonatomic, retain) NSArray * data;

@end