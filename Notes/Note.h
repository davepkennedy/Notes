//
//  Note.h
//  Notes
//
//  Created by Dave Kennedy on 09/02/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject <NSCoding>

@property (readonly) NSString* title;
@property (readonly) NSDate* modified;
@property NSMutableAttributedString* content;
@property NSMutableArray* actions;

@end
