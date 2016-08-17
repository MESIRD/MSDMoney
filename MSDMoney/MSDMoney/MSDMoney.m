//
//  MSDMoney.m
//  MSDMoney
//
//  Created by mesird on 14/08/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import "MSDMoney.h"

@interface MSDMoney ()

@property (nonatomic, strong) NSDecimalNumber *amount;

@end

@implementation MSDMoney

@end




@implementation MSDMoney (Creation)

- (instancetype)init {
    
    if (self = [super init]) {
        _amount = [NSDecimalNumber zero];
    }
    return self;
}

- (instancetype)initWithString:(NSString *)amount {
    
    if (self = [super init]) {
        if ([self p_validateAmountString:amount]) {
            _amount = [NSDecimalNumber decimalNumberWithString:amount];
        } else {
            _amount = [NSDecimalNumber zero];
        }
    }
    return self;
}

- (instancetype)initWithDecimal:(MSDDecimal)amount {
    
    if (self = [super init]) {
        _amount = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f", amount]];
    }
    return self;
}

- (BOOL)p_validateAmountString:(NSString *)amount {
    // FIXME
    return YES;
}

@end

@implementation MSDMoney (Calculation)

- (MSDMoney *)moneyByAddingMoney:(MSDMoney *)money {
    
    [self p_validateCalculationMoney:money];
    
    MSDMoney *newMoney = [[MSDMoney alloc] init];
    NSDecimalNumber *amount = [money valueForKey:@"amount"];
    NSDecimalNumber *newAmount = [_amount decimalNumberByAdding:amount];
    [newMoney setValue:newAmount forKey:@"amount"];
    return newMoney;
}

- (MSDMoney *)moneyBySubtractingMoney:(MSDMoney *)money {
    
    [self p_validateCalculationMoney:money];
    
    MSDMoney *newMoney = [[MSDMoney alloc] init];
    NSDecimalNumber *amount = [money valueForKey:@"amount"];
    NSDecimalNumber *newAmount = [_amount decimalNumberBySubtracting:amount];
    [newMoney setValue:newAmount forKey:@"amount"];
    return newMoney;
}

- (MSDMoney *)moneyByMultiplingDecimal:(MSDDecimal)decimal {
    
}

- (MSDMoney *)moneyByDividedByDecimal:(MSDDecimal)decimal {
    
}

- (void)addMoney:(MSDMoney *)money;
- (void)subtractMoney:(MSDMoney *)money;
- (void)multiplyDecimal:(MSDDecimal)decimal;
- (void)dividedByDecimal:(MSDDecimal)decimal;

- (void)p_validateCalculationMoney:(MSDMoney *)money {
    
    NSAssert(!money, @"money can not be nil");
    NSDecimalNumber *amount1 = _amount;
    NSAssert(!amount1, @"money has not been initialized");
    NSDecimalNumber *amount2 = [money valueForKey:@"amount"];
    NSAssert(!amount2, @"the adding money has not been initialized");
}

@end

@implementation MSDMoney (Comparison)

- (MSDCompareResult)compareWithMoney:(MSDMoney *)money;

@end

@implementation MSDMoney (Formation)

- (NSString *)stringValue;
- (MSDDecimal)decimalValue;

@end
