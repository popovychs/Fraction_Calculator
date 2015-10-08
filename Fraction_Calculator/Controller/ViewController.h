//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by popovychs on 05.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void) processDigit: (NSInteger) digit;
-(void) processOp: (char) theOp;
-(void) storeFractPart;

// for process buttons

-(IBAction)clickDigit:(UIButton*)sender;

// arithmetic operations buttons

-(IBAction)clickPlus;
-(IBAction)clickMinus;
-(IBAction)clickMultiply;
-(IBAction)clickDivide;

// rest of buttons

-(IBAction)clickOver;
-(IBAction)clickEquals;
-(IBAction)clickClear;

@end