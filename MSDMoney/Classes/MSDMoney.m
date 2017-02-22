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
    return [MSDMoney isValidMoneyFormat:amount];
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
    NSDecimalNumber *amount = money.amount;
    NSDecimalNumber *newAmount = [_amount decimalNumberByAdding:amount];
    newMoney.amount = newAmount;
    return newMoney;
}

- (MSDMoney *)moneyBySubtractingMoney:(MSDMoney *)money {
    
    [self _validateCalculationMoney:self];
    [self _validateCalculationMoney:money];

    MSDMoney *newMoney = [[MSDMoney alloc] init];
    NSDecimalNumber *amount = money.amount;
    NSDecimalNumber *newAmount = [_amount decimalNumberBySubtracting:amount];
    newMoney.amount = newAmount;
    return newMoney;
}

- (MSDMoney *)moneyByMultiplingDecimal:(MSDDecimal)decimal {
    
    [self _validateCalculationMoney:self];
    
    MSDMoney *newMoney = [[MSDMoney alloc] init];
    NSDecimalNumber *newAmount = [_amount decimalNumberByMultiplyingBy:[self _decimalNumberWithDecimal:decimal]];
    newMoney.amount = newAmount;
    return newMoney;
}

- (MSDMoney *)moneyByDividedByDecimal:(MSDDecimal)decimal {
    
    [self _validateCalculationMoney:self];
    if (decimal == 0) {
        NSAssert(decimal == 0, @"devisior cannot be zero");
    }
    
    MSDMoney *newMoney = [[MSDMoney alloc] init];
    NSDecimalNumber *newAmount = [_amount decimalNumberByDividingBy:[self _decimalNumberWithDecimal:decimal]];
    newMoney.amount = newAmount;
    return newMoney;
}

- (void)addMoney:(MSDMoney *)money {
    
    [self _validateCalculationMoney:self];
    [self _validateCalculationMoney:money];
    
    _amount =  [_amount decimalNumberByAdding:money.amount];
}

- (void)subtractMoney:(MSDMoney *)money {
    
    [self _validateCalculationMoney:self];
    [self _validateCalculationMoney:money];
    
    _amount = [_amount decimalNumberBySubtracting:money.amount];
}

- (void)multiplyDecimal:(MSDDecimal)decimal {
    
    [self _validateCalculationMoney:self];
    
    _amount = [_amount decimalNumberByMultiplyingBy:[self _decimalNumberWithDecimal:decimal]];
}

- (void)dividedByDecimal:(MSDDecimal)decimal {
    
    [self _validateCalculationMoney:self];
    if (decimal == 0) {
        NSAssert(decimal == 0, @"devisior cannot be zero");
    }
    
    _amount = [_amount decimalNumberByDividingBy:[self _decimalNumberWithDecimal:decimal]];
}

- (void)_validateCalculationMoney:(MSDMoney *)money {
    
    NSAssert(!money, @"money can not be nil");
    NSAssert(!money.amount, @"money has not been initialized");
}

@end

@implementation MSDMoney (Comparison)

- (MSDCompareResult)compareWithMoney:(MSDMoney *)money {
    return (MSDCompareResult)[_amount compare:money.amount];
}

@end

@implementation MSDMoney (Formation)

- (NSString *)stringValue {
    return _amount.stringValue;
}

- (MSDDecimal)decimalValue {
    return _amount.doubleValue;
}

@end

@implementation MSDMoney (Validation)

+ (BOOL)isValidMoneyFormat:(NSString *)money {
    
    NSString *regex = @"^[0-9]+([.]{0}|[.]{1}[0-9]+)$";
    if ([money rangeOfString:regex options:NSRegularExpressionSearch].location != NSNotFound) {
        return YES;
    }
    
    return NO;
}

@end
