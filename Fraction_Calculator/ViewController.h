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

@end