//
//  ImageDescViewController.h
//  testtest
//
//  Created by denis morozov on 20.08.12.
//  Copyright (c) 2012 SWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDescViewController : UIViewController<UITextViewDelegate>
{
	
}

- (id)initWithConf: (NSDictionary*) conf;
- (void)keyboardWasShown:(NSNotification*)aNotification;

@end
