//
//  ObjCalcAppDelegate.h
//  ObjCalc
//
//  Created by Riccardo Cambiassi on 01/07/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

@interface CalculatorViewController : UIViewController {
    NSString *oper;
    float buffer, rightOp;

}

@property (nonatomic, weak) IBOutlet UITextField *display;
@property (nonatomic, weak) IBOutlet UILabel *equation;
@property (nonatomic, weak) IBOutlet UIButton *plusButton;
@property (nonatomic, weak) IBOutlet UIButton *minusButton;
@property (nonatomic, weak) IBOutlet UIButton *multiplyButton;
@property (nonatomic, weak) IBOutlet UIButton *divideButton;

- (IBAction)addDigit:(id) sender;
- (IBAction)setOperator: (id) sender;
- (IBAction)unaryOperator: (id) sender;
- (IBAction)resolveOperation: (id) sender;
- (IBAction)clear: (id) sender;

@end
