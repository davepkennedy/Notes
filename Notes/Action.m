//
//  Action.m
//  Notes
//
//  Created by Dave Kennedy on 16/02/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import "Action.h"

#define OWNER_KEY   @"owner"
#define DUEDATE_KEY @"duedate"
#define DETAIL_KEY  @"detail"

@implementation Action

@synthesize owner, dueDate, detail;

- (instancetype) init {
    return [self initWithDetail:@"Action Detail"];
}

- (instancetype) initWithDetail:(NSString*) theDetail {
    self = [super init];
    if (self) {
        self.owner = NSUserName();
        self.dueDate = [NSDate date];
        self.detail = theDetail;
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.owner = [aDecoder decodeObjectForKey:OWNER_KEY];
        self.dueDate = [aDecoder decodeObjectForKey:DUEDATE_KEY];
        self.detail = [aDecoder decodeObjectForKey:DETAIL_KEY];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.owner forKey:OWNER_KEY];
    [aCoder encodeObject:self.dueDate forKey:DUEDATE_KEY];
    [aCoder encodeObject:self.detail forKey:DETAIL_KEY];
}

@end
