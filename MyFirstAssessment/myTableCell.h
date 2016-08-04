//
//  myTableCell.h
//  testtest
//
//  Created by denis morozov on 21.08.12.
//  Copyright (c) 2012 SWS. All rights reserved.
//

@class myTableCell;
@class myTableCellController;

@interface myTableCellController : UIViewController
{
	UILabel *label;
}

@property (nonatomic, retain) IBOutlet UILabel * label;

@end

@interface myTableCell : UITableViewCell
{
	myTableCellController *mtcc;
	UILabel *label;
}

@property (nonatomic, retain) UILabel * label;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier nibFile: (NSString *) nibFile;

@end
