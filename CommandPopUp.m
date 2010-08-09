//
//  CommandPopUp.m
//
//  Created by SPARKLABS7 on 8/9/10.
//  Copyright 2010 SPARKLABS. All rights reserved.
//

#import "CommandPopUp.h"

@implementation CommandPopUp

- (id)initWithFrame:(NSRect)rect
{
	if (self = [super initWithFrame:rect])
	{
		NSLog(@"w %f h %f", rect.size, rect);
		
		thePopUpButton = [[NSPopUpButton alloc] initWithFrame:rect pullsDown:NO];
	
		[thePopUpButton addItemWithTitle:@"Jonathan"];
		
	}
	
	return self;
}

- (void)awakeFromNib
{
	[self addSubview:thePopUpButton];
	[self setNeedsDisplay:YES];
}

@end
