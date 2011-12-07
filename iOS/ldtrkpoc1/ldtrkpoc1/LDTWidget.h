//
//  LDTWidget.h
//  ldtrkpoc1
//
//  Created by Shane Zatezalo on 12/7/11.
//  Copyright (c) 2011 Personal. All rights reserved.
//

@interface LDTWidget : NSObject {
    NSNumber *widgetID;
    NSString *name;
    NSString *summary;
}

@property (nonatomic, retain) NSNumber *widgetID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *summary;

@end
