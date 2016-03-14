//
//  AppDelegate.m
//  Notes
//
//  Created by Dave Kennedy on 09/02/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import "AppDelegate.h"
#import "Action.h"
#import "NotesController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NotesController* notesController;
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSWindow *actionPanel;
@property IBOutlet NSTextView *noteEditor;
@property IBOutlet NSArrayController* noteActionArrayController;

- (IBAction)toggleActionPanelVisibility:(id)sender;
- (IBAction)createActionItem:(id)sender;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.notesController load];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [self.notesController save];
}

- (IBAction)toggleActionPanelVisibility:(id)sender {
    NSRect frame = self.window.frame;
    [self.actionPanel setFrameOrigin:NSMakePoint(frame.origin.x + frame.size.width, frame.origin.y)];
    self.actionPanel.isVisible = !self.actionPanel.isVisible;
}

- (IBAction)createActionItem:(id)sender {
    NSRange selectedRange = [self.noteEditor selectedRange];
    
    Action* action = [[Action alloc] initWithDetail:[[self.noteEditor string] substringWithRange:selectedRange]];
    [self.noteActionArrayController addObject:action];
}

@end
