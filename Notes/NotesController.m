//
//  NotesController.m
//  Notes
//
//  Created by Dave Kennedy on 09/02/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import "NotesController.h"

@interface NotesController ()

- (NSString*) dataPath;
- (void) load;
- (void) save;
- (void) periodicSave:(NSTimer*)aTimer;

@end

@implementation NotesController

@synthesize noteCollections;

- (instancetype) init {
    self = [super init];
    if (self) {
        self.noteCollections = [NSMutableArray array];
        [NSTimer scheduledTimerWithTimeInterval:20
                                         target:self
                                       selector:@selector(periodicSave:)
                                       userInfo:nil
                                        repeats:YES];
    }
    return self;
}

- (void) dealloc {
    [self save];
}

- (id) valueForUndefinedKey:(NSString *)key {
    NSLog(@"Looking up undefined key %@", key);
    return [super valueForUndefinedKey:key];
}

- (NSString*) dataPath {
    NSError* error;
    NSURL* url = [[NSFileManager defaultManager] URLForDirectory:NSApplicationSupportDirectory
                                           inDomain:NSUserDomainMask
                                  appropriateForURL:nil
                                             create:NO error:&error];
    return [[url path] stringByAppendingPathComponent:@"notes.data"];
}

- (void) load {
    NSString* dataPath = [self dataPath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        self.noteCollections = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
    }
}

- (void) save {
    NSString* dataPath = [self dataPath];
    [NSKeyedArchiver archiveRootObject:self.noteCollections toFile:dataPath];
}

- (void) periodicSave:(NSTimer*)aTimer {
    [self save];
}

@end
