//
//  NotesCollection.h
//  Notes
//
//  Created by Dave Kennedy on 09/02/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotesCollection : NSObject <NSCoding>

@property NSString* title;
@property NSMutableArray* notes;

@end
