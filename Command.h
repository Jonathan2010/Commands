//
//  Command.h
//  GIT commands
//
//  Created by SPARKLABS7 on 8/9/10.
//  Copyright 2010 SPARKLABS. All rights reserved.
//


@interface Command : NSObject
{
	NSString *application;
	NSArray *arguments;
	NSString *directory;
}

@property (nonatomic, retain) NSString *application;
@property (nonatomic, retain) NSArray *arguments;
@property (nonatomic, retain) NSString *directory;

+ (Command *)commandWithDictionary:(NSDictionary *)theDictionary;
- (NSDictionary *)dictionary;

+ (NSDictionary *)loadCommandFile;

@end
