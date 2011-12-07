//
//  LDTViewController.h
//  ldtrkpoc1
//
//  Created by Shane Zatezalo on 12/6/11.
//  Copyright (c) 2011 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@class LDTWidget;

@interface LDTViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, RKObjectLoaderDelegate> {
    UITableView  *_tableView;
	NSArray *widgets;
}

//@property (nonatomic, retain) IBOutlet UITableView *_tableView;
@end
