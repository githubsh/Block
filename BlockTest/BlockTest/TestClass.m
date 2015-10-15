//
//  TestClass.m
//  BlockTest
//
//  Created by steven on 15/10/3.
//  Copyright © 2015年 steven. All rights reserved.
//

#import "TestClass.h"

typedef int (^blk_t) (int);

@implementation TestClass

- (int)methodUsingBlock:(blk_t)blk rate:(int)rate
{
    return blk(rate);
}


@end
