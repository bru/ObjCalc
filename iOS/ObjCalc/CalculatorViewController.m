//
//  ObjCalcAppDelegate.m
//  ObjCalc
//
//  Created by Riccardo Cambiassi on 01/07/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

@synthesize display, plusButton, minusButton, multiplyButton, divideButton,equation;

-(void)viewDidLoad{
    [display setText:@"0"];
    buffer = 0;
    rightOp = 0;
}

- (IBAction)addDigit:(id)sender {
    NSString *digit = ((UIButton *)sender).titleLabel.text;
  NSString *current = [display text];
  if ([current isEqualToString:@"0"] && ![digit isEqualToString:@"."]) {
    current = digit;
  } else {
    current = [current stringByAppendingString:digit];
  }
  rightOp = [current floatValue];
  [display setText:(NSString *)current];
    [equation setText:[NSString stringWithFormat:@"%f %@ %f",buffer,oper,rightOp]];
}

- (IBAction)setOperator:(id)sender {
  buffer = [display.text floatValue];
  [display setText:@"0"];
  oper = ((UIButton *)sender).titleLabel.text;
    [equation setText:[NSString stringWithFormat:@"%f %@ %f",buffer,oper,rightOp]];
}

- (IBAction)unaryOperator:(id)sender {
  [self setOperator:sender];
  [self resolveOperation:sender];
}

- (IBAction)clear:(id)sender {
  buffer = rightOp = 0;
  oper = nil;
  [display setText:@"0"];
    [equation setText:@""];
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
  [display setText:[[NSNumber numberWithFloat:value] stringValue]];
    [equation setText:[NSString stringWithFormat:@"%f %@ %f",buffer,oper,rightOp]];
}

@end
