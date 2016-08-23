//
//  MSDMoney.h
//  MSDMoney
//
//  Created by mesird on 14/08/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef double MSDDecimal;
typedef NS_ENUM(NSInteger, MSDCompareResult) {
    MSDCompareResultSmaller = -1,
    MSDCompareResultEqual   =  0,
    MSDCompareResultLarger  =  1
};

@interface MSDMoney : NSObject

@end


@interface MSDMoney (Creation)

- (instancetype)initWithString:(NSString *)amount;
- (instancetype)initWithDecimal:(MSDDecimal)amount;

@end

@interface MSDMoney (Configuration)

- (void)configureRoundingMode:(NSRoundingMode)roundingMode;
- (void)configureScale:(short)scale;

@end

@interface MSDMoney (Calculation)

- (MSDMoney *)moneyByAddingMoney:(MSDMoney *)money;
- (MSDMoney *)moneyBySubtractingMoney:(MSDMoney *)money;
- (MSDMoney *)moneyByMultiplingDecimal:(MSDDecimal)decimal;
- (MSDMoney *)moneyByDividedByDecimal:(MSDDecimal)decimal;

- (void)addMoney:(MSDMoney *)money;
- (void)subtractMoney:(MSDMoney *)money;
- (void)multiplyDecimal:(MSDDecimal)decimal;
- (void)dividedByDecimal:(MSDDecimal)decimal;

@end

@interface MSDMoney (Comparison)

- (MSDCompareResult)compareWithMoney:(MSDMoney *)money;

@end

@interface MSDMoney (Formation)

- (NSString *)stringValue;
- (MSDDecimal)decimalValue;

@end

