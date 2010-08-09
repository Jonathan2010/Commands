//
//  ButtonView.m
//
//  Created by Jonathan Burget on 8/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ButtonView.h"

@implementation ButtonView

- (id)initWithFrame:(NSRect)frameRect
{
	if (self = [super initWithFrame:frameRect])
	{
		theButtonDictionary = [[NSMutableDictionary alloc] init];
		
		tagCount = 0;
		yButton = 297;
		//NSLog(@"initWithFrame");
	}
	
	return self;
}

- (void)awakeFromNib
{
	[self createButton:@"Push GIT"];
	[self createButton:@"Jonathan"];
	
	//NSLog(@"it works");
}

- (void)createButton:(NSString *)theName 
{
	NSButton *theButton = [[NSButton alloc] initWithFrame:NSMakeRect(14.0, yButton, 20.0, 32.0)]; // 233 - 265 - 297 ~ 32pixels apart
	yButton -= 32;
	
	[theButton setBezelStyle:NSRoundedBezelStyle];
	[theButton setButtonType:NSMomentaryPushInButton];
	[theButton setTitle:theName];
	[theButton sizeToFit];
	
	[self addSubview:theButton];
	[self setNeedsDisplay:YES];	
	
	[theButton setTag:tagCount++];
	
	[theButtonDictionary setObject:theButton forKey:theName];
}

- (void)drawRect:(NSRect)rect
{
	int i;
	NSButton *theButton = nil;
	NSArray *theArray = [theButtonDictionary allKeys];
	
	for (i = 0; i < [theArray count]; i++)
	{
		theButton = [theButtonDictionary objectForKey:[theArray objectAtIndex:i]];
		
		if ([theButton state] == NSOnState)
		{
			NSLog(@"button hit with tag %i", [theButton tag]);
			[theButton setState:NSOffState];
			[self runCommandLineTool:[theArray objectAtIndex:i]];
		}
	}
}

- (void)runCommandLineTool:(NSString *)theName
{
	if ([theName isEqualToString:@"Jonathan"])
	{
		
	}
}

- (IBAction)print:(id)sender
{
}

@end
