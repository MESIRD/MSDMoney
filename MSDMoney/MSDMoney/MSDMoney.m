//
//  MSDMoney.m
//  MSDMoney
//
//  Created by mesird on 14/08/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import "MSDMoney.h"

@interface MSDMoney ()
{
    NSRoundingMode _roundingMode;
    short _scale;
}

@property (nonatomic, strong) NSDecimalNumber *amount;
@property (nonatomic, strong) NSDecimalNumberHandler *handler;

@end

@implementation MSDMoney

@end




@implementation MSDMoney (Creation)

- (instancetype)init {
    
    if (self = [super init]) {
        _amount  = [NSDecimalNumber zero];
    }
    return self;
}

- (instancetype)initWithString:(NSString *)amount {
    
    if (self = [super init]) {
        if ([self _validateAmountString:amount]) {
            _amount = [NSDecimalNumber decimalNumberWithString:amount];
        } else {
            _amount = [NSDecimalNumber zero];
        }
    }
    return self;
}

- (instancetype)initWithDecimal:(MSDDecimal)amount {
    
    if (self = [super init]) {
        _amount  = [self _decimalNumberWithDecimal:amount];
    }
    return self;
}

- (BOOL)_validateAmountString:(NSString *)amount {
    // FIXME
    return YES;
}

- (NSDecimalNumber *)_decimalNumberWithDecimal:(MSDDecimal)decimal {
    return [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f", decimal]];
}

@end

@implementation MSDMoney (Configuration)

- (NSDecimalNumberHandler *)handler {
    
    if (!_handler || _handler.scale != _scale || _handler.roundingMode != _roundingMode) {
        _handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:_roundingMode scale:_scale raiseOnExactness:YES raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
    }
    return _handler;
}

- (void)configureRoundingMode:(NSRoundingMode)roundingMode {
    _roundingMode = roundingMode;
}

- (void)configureScale:(short)scale {
    _scale = scale;
}

@end

@implementation MSDMoney (Calculation)

- (MSDMoney *)moneyByAddingMoney:(MSDMoney *)money {
    
    [self _validateCalculationMoney:self];
    [self _validateCalculationMoney:money];
    
    MSDMoney *newMoney = [[MSDMoney alloc] init];
    NSDecimalNumber *amount = [money valueForKey:@"amount"];
    NSDecimalNumber *newAmount = [_amount decimalNumberByAdding:amount];
    [newMoney setValue:newAmount forKey:@"amount"];
    return newMoney;
}

- (MSDMoney *)moneyBySubtractingMoney:(MSDMoney *)money {
    
    [self _validateCalculationMoney:self];
    [self _validateCalculationMoney:money];

    MSDMoney *newMoney = [[MSDMoney alloc] init];
    NSDecimalNumber *amount = [money valueForKey:@"amount"];
    NSDecimalNumber *newAmount = [_amount decimalNumberBySubtracting:amount];
    [newMoney setValue:newAmount forKey:@"amount"];
    return newMoney;
}

- (MSDMoney *)moneyByMultiplingDecimal:(MSDDecimal)decimal {
    
    [self _validateCalculationMoney:self];
    
    NSDecimalNumber *newAmount = [_amount decimalNumberByMultiplyingBy:[self _decimalNumberWithDecimal:decimal]];
    
}

- (MSDMoney *)moneyByDividedByDecimal:(MSDDecimal)decimal {
    
}

- (void)addMoney:(MSDMoney *)money;
- (void)subtractMoney:(MSDMoney *)money;
- (void)multiplyDecimal:(MSDDecimal)decimal;
- (void)dividedByDecimal:(MSDDecimal)decimal;

- (void)_validateCalculationMoney:(MSDMoney *)money {
    
    NSAssert(!money, @"money can not be nil");
    NSDecimalNumber *amount = [money valueForKey:@"amount"];
    NSAssert(!amount, @"money has not been initialized");
}

@end

@implementation MSDMoney (Comparison)

- (MSDCompareResult)compareWithMoney:(MSDMoney *)money;

@end

@implementation MSDMoney (Formation)

- (NSString *)stringValue;
- (MSDDecimal)decimalValue;

@end
