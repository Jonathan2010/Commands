//
//  Controller.h
//
//  Created by SPARKLABS7 on 8/9/10.
//  Copyright 2010 SPARKLABS. All rights reserved.
//

@interface Controller : NSObject
{
    IBOutlet NSTextView *theTextOutput;

	NSMutableString *theAppName;
}

- (IBAction)launch:(id)sender;

@end
