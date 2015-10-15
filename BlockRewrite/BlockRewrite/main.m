//
//  main.m
//  BlockRewrite
//
//  Created by steven on 15/10/3.
//  Copyright © 2015年 steven. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    void (^blk)(void) = ^{printf("Block\n");};
    
    blk();
    
    return 0;
}
