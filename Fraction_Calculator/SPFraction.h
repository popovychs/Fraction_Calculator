//
//  SPFraction.h
//  Fraction_Calculator
//
//  Created by popovychs on 05.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPFraction : NSObject

@property (assign, nonatomic) NSInteger numerator, denominator;

-(void) print;
-(void) setTo: (NSInteger) n over: (NSInteger) d;

-(SPFraction*) add: (SPFraction*) f;
-(SPFraction*) subtract: (SPFraction*) f;
-(SPFraction*) multiply: (SPFraction*) f;
-(SPFraction*) divide: (SPFraction*) f;

-(void) reduce;
-(double) convertToNum;
-(NSString*) convertToString;

@end
