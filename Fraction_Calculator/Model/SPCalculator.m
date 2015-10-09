//
//  SPCalculator.m
//  Fraction_Calculator
//
//  Created by popovychs on 05.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPCalculator.h"

@implementation SPCalculator

@synthesize operand1, operand2, accumulator;

- (id)init
{
    self = [super init];
    if (self) {
        operand1 = [SPFraction new];
        operand2 = [SPFraction new];
        accumulator = [SPFraction new];
    }
    return self;
}

-(void) clear
{
    accumulator.numerator = 0;
    accumulator.denominator = 0;
}

-(SPFraction*) performOperation:(char)op
{
    SPFraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add:operand2];
            break;
        case '-':
            result = [operand1 subtract:operand2];
            break;
        case '*':
            result = [operand1 multiply:operand2];
            break;
        case '/':
            result = [operand1 divide:operand2];
            break;
    }
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    
    return accumulator;
}

@end
