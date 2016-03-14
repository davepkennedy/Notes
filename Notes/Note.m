//
//  Note.m
//  Notes
//
//  Created by Dave Kennedy on 09/02/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import "Note.h"

#define TITLE_KEY       @"title"
#define MODIFIED_KEY    @"modified"
#define CONTENT_KEY     @"content"
#define ACTIONS_KEY     @"actions"

@interface Note () {
    NSMutableAttributedString* _content;
    NSDate* _modifiedDate;
}

- (void) setModifiedDate:(NSDate*) aDate;
@end

@implementation Note

@synthesize actions;

- (instancetype) init {
    self = [super init];
    if (self) {
        //self.title = @"Untitled Note";
        //self.modified = [NSDate date];
        _modifiedDate = [NSDate date];
        self.content = [[NSMutableAttributedString alloc] initWithString:@"New note"];
        self.actions = [NSMutableArray array];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        //self.title = [aDecoder decodeObjectForKey:TITLE_KEY];
        //self.modified = [aDecoder decodeObjectForKey:MODIFIED_KEY];
        _content = [aDecoder decodeObjectForKey:CONTENT_KEY];
        self.actions = [aDecoder decodeObjectForKey:ACTIONS_KEY];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:TITLE_KEY];
    [aCoder encodeObject:self.modified forKey:MODIFIED_KEY];
    [aCoder encodeObject:self.content forKey:CONTENT_KEY];
    [aCoder encodeObject:self.actions forKey:ACTIONS_KEY];
}

- (void) setContent:(NSMutableAttributedString *)content {
    [self willChangeValueForKey:@"content"];
    [self willChangeValueForKey:@"title"];
    _content = content;
    [self didChangeValueForKey:@"content"];
    [self didChangeValueForKey:@"title"];
    [self setModifiedDate:[NSDate date]];
}

- (NSMutableAttributedString*) content {
    return _content;
}

- (void) setModifiedDate:(NSDate *)aDate {
    [self willChangeValueForKey:@"modified"];
    _modifiedDate = aDate;
    [self didChangeValueForKey:@"modified"];
}

- (NSString*) title {
    NSRange foundRange = [_content.string rangeOfString:@"\n"];
    if (foundRange.location == NSNotFound) {
        return _content.string;
    }
    return [_content.string substringToIndex:foundRange.location];
}

- (NSDate*) modified {
    return _modifiedDate;
}

@end
