//
//  ObjCalcAppDelegate.h
//  ObjCalc
//
//  Created by Riccardo Cambiassi on 01/07/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ObjCalcAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSTextField *display;
    NSButton *plusButton;
    NSButton *minusButton;
    NSButton *multiplyButton;
    NSButton *divideButton;
    NSString *oper;
    float buffer, rightOp;

}

@property (assign) IBOutlet NSWindow *window;
@property (retain) IBOutlet NSTextField *display;
@property (retain) IBOutlet NSButton *plusButton;
@property (retain) IBOutlet NSButton *minusButton;
@property (retain) IBOutlet NSButton *multiplyButton;
@property (retain) IBOutlet NSButton *divideButton;

- (IBAction)addDigit:(id) sender;
- (IBAction)setOperator: (id) sender;
- (IBAction)unaryOperator: (id) sender;
- (IBAction)resolveOperation: (id) sender;
- (IBAction)clear: (id) sender;

@end
