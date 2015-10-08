//
//  ViewController.m
//  Fraction_Calculator
//
//  Created by popovychs on 05.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "ViewController.h"
#import "SPCalculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    NSInteger currentNumber;
    BOOL firstOperand, isNumerator;
    SPCalculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad {

    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [SPCalculator new];
}

-(void) processDigit:(NSInteger)digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    display.text = displayString;
}

-(IBAction)clickDigit:(UIButton *)sender
{
    NSInteger digit = sender.tag;
    
    [self processDigit:digit];
}

-(void)processOp:(char)theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" x ";
            break;
        case '/':
            opStr = @" ÷ ";
            break;
    }
    
    [self storeFractPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    display.text = displayString;
}

-(void) storeFractPart
{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        } else {
            myCalculator.operand1.denominator = currentNumber;
        }
    } else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    } else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    currentNumber = 0;
}

#pragma mark - arithmetic operations buttons

-(IBAction)clickPlus
{
    [self processOp:'+'];
}

-(IBAction)clickMinus
{
    [self processOp:'-'];
}

-(IBAction)clickMultiply
{
    [self processOp:'*'];
}

-(IBAction)clickDivide
{
    [self processOp:'/'];
}

#pragma mark - rest of buttons

-(IBAction)clickOver
{
    [self storeFractPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}

-(IBAction)clickEquals
{
    if (firstOperand == NO) {
        [self storeFractPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}

-(IBAction)clickClear
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
}

@end
