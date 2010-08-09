//
//  Command.m
//  GIT commands
//
//  Created by SPARKLABS7 on 8/9/10.
//  Copyright 2010 SPARKLABS. All rights reserved.
//

#import "Command.h"


@implementation Command

@synthesize application, arguments, directory;

+ (Command *)commandWithDictionary:(NSDictionary *)theDictionary
{
	Command *newCommand = [[[Command alloc] init] autorelease];
	
	/*[newCommand setName:[theDictionary objectForKey:@"application directory"]];
	[newCommand setArguments:[theDictionary objectForKey:@"arguments"]];
	[newCommand setDirectory:[theDictionary objectForKey:@"directory"]];*/
		
	return newCommand;
}

- (NSDictionary *)dictionary
{
	NSMutableDictionary *theDictionary = [NSMutableDictionary dictionary];
	
	if (application != nil)
	{
		[theDictionary setObject:application forKey:@"application directory"];
	}
	else
	{
		[theDictionary setObject:[NSString string] forKey:@"application directory"];
	}

	if (arguments != nil)
	{
		[theDictionary setObject:arguments forKey:@"arguments"];
	}
	else
	{
		[theDictionary setObject:[NSArray array] forKey:@"arguments"];
	}

	if (directory != nil)
	{
		[theDictionary setObject:directory forKey:@"directory"];
	}
	else
	{
		[theDictionary setObject:[NSString string] forKey:@"directory"];
	}	
	
	return theDictionary;
}

+ (NSDictionary *)loadCommandFile
{
	NSString *thePath = [[NSBundle mainBundle] pathForResource:@"CommandFile" ofType:@"plist"];
	NSDictionary *theDictionary = [[[NSDictionary alloc] initWithContentsOfFile:thePath] autorelease];
	
	return theDictionary;
}

- (void)dealloc
{
	if (application != nil)
		[application release];

	if (arguments != nil)
		[arguments release];

	if (directory != nil)
		[directory release];
	
	[super dealloc];
}

@end
