//
//  CTSHas.h
//  加密算法
//
//  Created by mac on 2020/5/29.
//  Copyright © 2020 mac. All rights reserved.
//


/*#### 签名规则:
1.签名keySign：95e8fbfe29aa45d4a6120e7270f62d23

2.参数key为字符串，value为字符数组。封装进行传递

3.循环将参数的key进行排序，循环获取value，进行value排序后转为数组，用逗号拼接

4.循环将key和value中间加入=号拼接，末尾加入#号

5.将获取的字符串进行HmacSha256Hex签名；
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTSHas : NSObject
/**
*  字典根据key值排序，并且key和value中间加入=号拼接，末尾加入#号。
*
*  @param dict      要排序的字典数组
*
*
*  @return 排序后key和value拼接的字符串
*/
+(NSString *)sortKeyArr:(NSDictionary *)dict;
/**
*  加密方式,MAC算法: HmacSHA256
*
*  @param secret       秘钥
*  @param content 要加密的文本
*
*  @return 加密后的字符串
*/
+ (NSString *)hmacSHA256WithSecret:(NSString *)secret content:(NSString *)content;
@end

NS_ASSUME_NONNULL_END
