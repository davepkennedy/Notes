//
//  NotesCollection.m
//  Notes
//
//  Created by Dave Kennedy on 09/02/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import "NotesCollection.h"
#define TITLE_KEY   @"title"
#define NOTES_KEY   @"notes"

@implementation NotesCollection

@synthesize title, notes;

- (instancetype) init {
    self = [super init];
    if (self) {
        self.title = @"Untitled Note Collection";
        self.notes = [NSMutableArray array];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:TITLE_KEY];
        self.notes = [aDecoder decodeObjectForKey:NOTES_KEY];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:TITLE_KEY];
    [aCoder encodeObject:self.notes forKey:NOTES_KEY];
}

@end
