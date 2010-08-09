//
//  Controller.m
//
//  Created by SPARKLABS7 on 8/9/10.
//  Copyright 2010 SPARKLABS. All rights reserved.
//

#import "Controller.h"

#import "Command.h"

@implementation Controller

- (id)init
{
	if (self = [super init])
	{
		theAppName = [[NSMutableString alloc] init];
	
		[theAppName setString:@"Top"];
	}

	return self;
}

- (void)dealloc
{
	if (theAppName != nil)
		[theAppName release];
	
	[super dealloc];
}

- (IBAction)launch:(id)sender
{
	NSTask *theTask = [[NSTask alloc] init];
	NSDictionary *theDictionary = [[Command loadCommandFile] objectForKey:theAppName];
	NSMutableString *theDirectoryString = nil;
	
	NSPipe *newPipe = [NSPipe pipe];
	NSFileHandle *readHandle = [newPipe fileHandleForReading];
    NSData *inData;
	NSString *tempString;
	
	if ([[theDictionary objectForKey:@"directory"] length] > 0)
	{
		theDirectoryString = [NSMutableString string];
		[theDirectoryString setString:[theDictionary objectForKey:@"directory"]];
		
		if ([theDirectoryString characterAtIndex:0] == '~')
		{
			[theDirectoryString setString:[theDirectoryString stringByExpandingTildeInPath]];
		}
		
		[theTask setCurrentDirectoryPath:theDirectoryString];
	}
	
	[theTask setLaunchPath:[theDictionary objectForKey:@"application directory"]];
	[theTask setArguments:[theDictionary objectForKey:@"arguments"]];
	
	[theTask setStandardOutput:newPipe];
	[theTask setStandardError:newPipe];
	
	[theTask launch];
    [theTask waitUntilExit];
	
	inData = [readHandle readDataToEndOfFile];
	tempString = [[NSString alloc] initWithData:inData encoding:NSASCIIStringEncoding];

	if ([tempString length] > 0)
	{
		[theTextOutput insertText:tempString];
	}
	else 
	{
		[theTextOutput insertText:@"Finished Successfully"];
	}
	
	[theTask release];
	[tempString release];
	
	//NSLog(@"%@", tempString);
}

@end
