/*
 *  MagicKit.h
 *  MagicKit
 *
 *  Created by Aidan Steele on 10/10/10.
 *  Copyright 2010 Glass Echidna. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>

@interface MagicKit : NSObject {
    
}

+ (NSString *)mimeTypeForFileAtPath:(NSString *)path;
+ (NSString *)descriptionForFileAtPath:(NSString *)path;

+ (NSString *)mimeTypeForData:(NSData *)data;
+ (NSString *)descriptionForData:(NSData *)data;

+ (NSString *)descriptionForFileAtPath:(NSString *)path decompress:(BOOL)decompress mimeType:(BOOL)mimeType;
+ (NSString *)descriptionForData:(NSData *)data decompress:(BOOL)decompress mimeType:(BOOL)mimeType;

@end

