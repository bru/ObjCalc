//
//  ObjCalcAppDelegate.m
//  ObjCalc
//
//  Created by Riccardo Cambiassi on 01/07/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ObjCalcAppDelegate.h"

@implementation ObjCalcAppDelegate

@synthesize window, display, plusButton, minusButton, multiplyButton, divideButton;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
  [display setStringValue:@"0"];
  buffer = 0;
  rightOp = 0;
}

- (IBAction)addDigit:(id)sender {
  NSString *digit = [sender title];
  NSString *current = [display objectValue];
  if ([current isEqualToString:@"0"] && ![digit isEqualToString:@"."]) {
    current = digit;
  } else {
    current = [current stringByAppendingString:digit];
  }
  rightOp = [current floatValue];
  [display setStringValue:(NSString *)current];
}

- (IBAction)setOperator:(id)sender {
  buffer = [display floatValue];
  [display setObjectValue:@"0"];
  oper = [sender title];

  [plusButton setState: NSOffState];
  [minusButton setState: NSOffState];
  [multiplyButton setState: NSOffState];
  [divideButton setState: NSOffState];
  [sender setState:NSOnState];
}

- (IBAction)unaryOperator:(id)sender {
  [self setOperator:sender];
  [self resolveOperation:sender];
}

- (IBAction)clear:(id)sender {
  buffer = rightOp = 0;
  oper = nil;
  
  [plusButton setState: NSOffState];
  [minusButton setState: NSOffState];
  [multiplyButton setState: NSOffState];
  [divideButton setState: NSOffState];
  [display setObjectValue:@"0"];
}

- (IBAction)resolveOperation:(id)sender {
  float value = buffer;
  if ([oper isEqualToString: @"+"]) {
    value = buffer + rightOp;
  }
  if ([oper isEqualToString: @"-"]) {
      value = buffer - rightOp;
  }
  if ([oper isEqualToString: @"*"]) {
      value = buffer * rightOp;
  }
  if ([oper isEqualToString: @"÷"]) {
      value = buffer / rightOp;
  }
  if ([oper isEqualToString: @"±"]) { 
      value = (-1 * buffer);
  }

  
  buffer = value;
  [display setStringValue:[[NSNumber numberWithFloat:value] stringValue]]; 
}

@end
