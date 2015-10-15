//
//  main.m
//  BlockTest
//
//  Created by steven on 15/10/3.
//  Copyright © 2015年 steven. All rights reserved.
//

#import <Foundation/Foundation.h>

//int fu(int)
//{
//    return 5;
//}

int func(int count)
{
    return count +1;
}

//  blk变量作为函数参数和返回值

void func2(int (^blk)(int)) //blk变量作为函数参数:变量名为blk，变量类型为 int(^)(int)
{
    
}

int (^ func333() )(int)
{
    return ^(int count){
        return count +1;
    };
}

int (^ func3(int a,int b) )(int) //blk变量作为返回值:函数名和参数列表是func3()，返回值类型是int(^)(int)
{
    a ++;
    b --;
    return ^(int count){
        return count +1;
    };
}

//  typedef简写之后

typedef int INTT;

typedef int (^blk_t) (int);

void func22(blk_t blk)
{
    
}

blk_t func33()
{
    return nil;
}


//  在函数参数中使用Block类型变量并在函数中执行Block

int func999(blk_t blk, int rate)
{
    return blk(rate);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //  block带自动变量的匿名函数
        
        //  block的实现
        
        //  无返回值
        ^(int event) {
            printf("event=%zd",event);
        };
        
        ^void(int event) {
            printf("event=%zd",event);
        };
        
        //  有返回值
        ^int(int count){
            return count +1;
        };
        
        //  无参数，无返回值
        //  详写
        ^void(void){
            printf("Block\n");
        };
        
        //  简写，返回值void和参数列表(void)都不写，只保留^插入符和{}大括号
        ^{
            printf("Block\n");
        };
        
        
        
        
        
        //  函数指针
        int (*funcptr)(int) = &func;
        
        //  调用
        int result = (*funcptr)(10);
        NSLog(@"函数指针调用函数result = %d",result);
        
        
        
        //  block类型变量
        //int (^blk)(int);
        
        int (^blk)(int) = ^(int count){
            return count +1;
        };
        
        int (^blk1)(int) = blk;
        
        int (^blk2)(int);
        
        blk2 = blk1;
        
        
        //  block类型变量作为函数参数和返回
        //  如上
        
        //  typedef简化block写法
        //  如上
        
        
        
        
        
        
        //  block调用
        
        result = blk(10);
        
        NSLog(@"block调用result = %d",result);
        
        
        
        //  在函数参数中使用Block类型变量并在函数中执行Block
        //  如上
        NSLog(@"func999返回值=%zd",func999(blk, 1));
        
        
        //  block指针
        //typedef int (^blk_tt) (int);//不加const会报错
        typedef int (^ const blk_tt) (int);
        
        blk_tt blk222 = ^(int count){return count + 1;};
        
        blk_tt *blkptr = &(blk222);
        
        (*blkptr)(10);
        
        
        
        
        
        
        //  截获自动变量(block保存自动变量瞬时值)
        int dmy = 256;
        int val = 10;
        const char *fmt = "val = %d\n";
        void (^blk666)(void) = ^{printf(fmt, val);};
        
        val = 2;
        fmt = "These values were changed. val = %d\n";
        
        blk666();
        printf(fmt, val);
        
        
        
        
        // __block
        
        __block int value = 0;
    
        void (^blk8888)(void) = ^{value = 1;};
        
        blk8888();
        
        printf("val = %d\n",val);
        
    
        //id array = [[NSMutableArray alloc]init];
        __block id array = [[NSMutableArray alloc]init];
        
        void (^blk111)(void) = ^{
          
            id obj = [[NSObject alloc]init];
            
            [array addObject:obj];//    正确
            
            //array = [NSMutableArray new];//错误
            
            array = [NSMutableArray new];//array加入__block修饰之后,正确
        };
        
        
        
        //const char text[] = "hello";//不能截获数组
        const char *text = "hello";
        void (^blk456)(void) = ^{
            printf("%c\n",text[2]);
        };
        
        
        
    }
    return 0;
}
