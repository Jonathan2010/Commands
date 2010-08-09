//
//  GIT_commandsAppDelegate.h
//  GIT commands
//
//  Created by Jonathan Burget on 8/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "ButtonView.h"

@interface GIT_commandsAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet ButtonView *view;
}

@property (assign) IBOutlet NSWindow *window;

@end
