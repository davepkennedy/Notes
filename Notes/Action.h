//
//  Action.h
//  Notes
//
//  Created by Dave Kennedy on 16/02/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Action : NSObject <NSCoding>

@property NSString* owner;
@property NSDate* dueDate;
@property NSString* detail;

- (instancetype) initWithDetail:(NSString*) detail;

@end
