//
//  main.m
//  排序字符串HmacSha256Hex加密
//
//  Created by mac on 2020/5/28.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>
#import "CTSHas.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //请求参数
        NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]init];
        //设置值
         [paraDict setObject:@(1) forKey:@"ringNumber"];
        [paraDict setObject:@(5) forKey:@"category"];
        [paraDict setObject:@(8) forKey:@"kind"];
        //排序
        NSString *sortString = [CTSHas sortKeyArr:paraDict];
        NSLog(@"字典排序后值--------%@",sortString);
        //签名keySign：95e8fbfe29aa45d4a6120e7270f62d23
        //对请求参数进行加密
        NSString *hasString = [CTSHas hmacSHA256WithSecret:@"95e8fbfe29aa45d4a6120e7270f62d23" content:sortString];
        NSLog(@"加密后的值---------%@",hasString);
        [paraDict setObject:hasString forKey:@"sign"];
        //后续操作请求接口等等。
    }
    return 0;
}

