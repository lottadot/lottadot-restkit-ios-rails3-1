//
//  LDTWidget.m
//  ldtrkpoc1
//
//  Created by Shane Zatezalo on 12/7/11.
//  Copyright (c) 2011 Personal. All rights reserved.
//

#import "LDTWidget.h"

@implementation LDTWidget

@synthesize widgetID;
@synthesize title;
@synthesize summary;

- (NSString*)description {
	return [NSString stringWithFormat:@"%@ (ID: %@)", self.title, self.widgetID];
}

@end
