//
//  NotesController.h
//  Notes
//
//  Created by Dave Kennedy on 09/02/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotesController : NSObject

@property NSMutableArray* noteCollections;

- (void) load;
- (void) save;

@end
