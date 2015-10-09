//
//  SPFraction.m
//  Fraction_Calculator
//
//  Created by popovychs on 05.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPFraction.h"

@implementation SPFraction

@synthesize numerator, denominator;

-(void) setTo:(NSInteger)n over:(NSInteger)d
{
    numerator = n;
    denominator = d;
}

-(void) print
{
    NSLog(@"%li/%li",(long)numerator,(long)denominator);
}

-(double) convertToNum
{
    if (denominator !=0) {
        return (double)numerator / denominator;
    } else {
        return NAN;
    }
}

-(NSString*) convertToString
{
    if (numerator == denominator) {
        if (numerator == 0) {
            return @"0";
        } else {
            return @"1";
        }
    } else if (denominator == 1) {
        return [NSString stringWithFormat:@"%li",(long)numerator];
    } else {
        return [NSString stringWithFormat:@"%li/%li",(long)numerator,(long)denominator];
    }
}

// methods of fractions add to receiver

-(SPFraction*) add: (SPFraction*) f
{
    SPFraction *result = [SPFraction new];
    
    result.numerator = numerator * f.denominator + denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

-(SPFraction*) subtract: (SPFraction*) f
{
    SPFraction *result = [SPFraction new];
    
    result.numerator = numerator * f.denominator - denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

-(SPFraction*) multiply: (SPFraction*) f
{
    SPFraction *result = [SPFraction new];
    
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

-(SPFraction*) divide: (SPFraction*) f
{
    SPFraction *result = [SPFraction new];
    
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    
    [result reduce];
    return result;
}

-(void)reduce
{
    NSInteger u = numerator;
    NSInteger v = denominator;
    NSInteger temp;
    
    if (u == 0) {
        return;
    } else if (u < 0) {
        u = -u;
    }
    
    while (v !=0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    numerator /= u;
    denominator /= u;
}

@end
