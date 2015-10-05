//
//  SPCalculator.h
//  Fraction_Calculator
//
//  Created by popovychs on 05.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPFraction.h"

@interface SPCalculator : NSObject

@property (strong, nonatomic) SPFraction *operand1;
@property (strong, nonatomic) SPFraction *operand2;
@property (strong, nonatomic) SPFraction *accumulator;

-(SPFraction*) performOperation: (char) op;
-(void) clear;

@end
