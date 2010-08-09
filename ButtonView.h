//
//  ButtonView.h
//
//  Created by Jonathan Burget on 8/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ButtonView : NSView
{
    IBOutlet NSMenu *menu;
    IBOutlet NSView *nextKeyView;

	NSMutableDictionary *theButtonDictionary;
	
	int tagCount;
	float yButton;
}

- (id)initWithFrame:(NSRect)frameRect;
- (void)awakeFromNib;
- (void)createButton:(NSString *)theName;
- (void)drawRect:(NSRect)rect;
- (void)runCommandLineTool:(NSString *)theName;

- (IBAction)print:(id)sender;
@end
