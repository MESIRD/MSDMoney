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

- (instancetype)initWithString:(NSString *)amount {
    
    if (self = [super init]) {
        if ([self p_validationAmountString:amount]) {
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

- (BOOL)p_validationAmountString:(NSString *)amount {
    // FIXME
    return YES;
}

@end

@implementation MSDMoney (Calculation)

- (MSDMoney *)moneyByAddingMoney:(MSDMoney *)money {
    
    NSAssert(!money, @"money can not be nil");
    
}

- (MSDMoney *)moneyBySubtractingMoney:(MSDMoney *)money {
    
}

- (MSDMoney *)moneyByMultiplingDecimal:(MSDDecimal)decimal {
    
}

- (MSDMoney *)moneyByDividedByDecimal:(MSDDecimal)decimal {
    
}

- (void)addMoney:(MSDMoney *)money;
- (void)subtractMoney:(MSDMoney *)money;
- (void)multiplyDecimal:(MSDDecimal)decimal;
- (void)dividedByDecimal:(MSDDecimal)decimal;

@end

@implementation MSDMoney (Comparison)

- (MSDCompareResult)compareWithMoney:(MSDMoney *)money;

@end

@implementation MSDMoney (Formation)

- (NSString *)stringValue;
- (MSDDecimal)decimalValue;

@end
