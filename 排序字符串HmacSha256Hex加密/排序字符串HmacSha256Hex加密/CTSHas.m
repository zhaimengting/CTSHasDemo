//
//  CTSHas.m
//  加密算法
//
//  Created by mac on 2020/5/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "CTSHas.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation CTSHas
/**
*  字典根据key值排序，并且key和value中间加入=号拼接，末尾加入#号。
*
*  @param dict      要排序的字典数组
*
*
*  @return 排序后key和value拼接的字符串
*/
+(NSString *)sortKeyArr:(NSDictionary *)dict{
    NSString *result = @"";
    NSArray *keyArr = [dict allKeys];
    //对字典里面的key值排序
    NSLocale *currentLocale = [NSLocale currentLocale];
    NSComparator finderSortBlock = ^(id string1,id string2) {
    NSRange string1Range =NSMakeRange(0, [string1 length]);
           return [string1 compare:string2 options:NSCaseInsensitiveSearch range:string1Range locale:currentLocale];
       };
    //排序处理
    NSArray *arr2 = [keyArr sortedArrayUsingComparator:finderSortBlock];
    //循环遍历排序
    for (int i = 0; i<arr2.count; i++) {
        result = [result stringByAppendingFormat:@"%@=%@#",arr2[i],dict[arr2[i]]];
    }
    return result;
}
/**
 *  加密方式,MAC算法: HmacSHA256
 *
 *  @param secret       秘钥
 *  @param content 要加密的文本
 *
 *  @return 加密后的字符串
 */
+ (NSString *)hmacSHA256WithSecret:(NSString *)secret content:(NSString *)content
{
    //密钥转换成 const char
    const char *cKey  = [secret cStringUsingEncoding:NSASCIIStringEncoding];
      // 加密的内容有可能有中文 所以用NSUTF8StringEncoding
    const char *cData = [content cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    //SHA256加密
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSMutableString *hexString = [NSMutableString string];
    //转换成字符串
    for (int i=0; i<sizeof(cHMAC); i++)
    {
        [hexString appendFormat:@"%02x", cHMAC[i]];
    }
    return hexString;
}
@end
