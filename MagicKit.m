//
//  MagicKit.m
//  MagicKit
//
//  Created by Aidan Steele on 10/10/10.
//  Copyright 2010 Glass Echidna. All rights reserved.
//
#import "MagicKit.h"
#import "magic.h"

const char *magicFilePathForiOS() {
    return [[[NSBundle mainBundle] pathForResource:@"magic" ofType:@"mgc"] UTF8String];
}

@interface MagicKit ()

+ (magic_t)sharedMagicCookie;
+ (NSString *)descriptionForObject:(id)object decompress:(BOOL)decompress mimeType:(BOOL)mimeType;

@end

@implementation MagicKit

+ (magic_t)sharedMagicCookie {
    static magic_t sharedCookie = NULL;
    
#if defined(TARGET_OS_MAC)
    const char *magicFile = NULL;
#else
    const char *magicFile = magicFilePathForiOS();
#endif
    
    if (sharedCookie == NULL) {
        sharedCookie = magic_open(MAGIC_NONE);
        
        if (sharedCookie == NULL || magic_load(sharedCookie, magicFile) == -1) {
            NSString *errorString = [NSString stringWithFormat:@"There was an error opening the magic database: %s", strerror(errno)];
            NSException *exception = [NSException exceptionWithName:@"MagicKit" reason:errorString userInfo:nil];
            
            [exception raise];
        }
    }
    
    return sharedCookie;
}

+ (NSString *)descriptionForObject:(id)object decompress:(BOOL)decompress mimeType:(BOOL)mimeType {
    int flags = MAGIC_NONE;
    if (decompress) flags |= MAGIC_COMPRESS;
    if (mimeType) flags |= MAGIC_MIME;
    
    magic_t cookie = [MagicKit sharedMagicCookie];
    magic_setflags(cookie, flags);
    const char *description = NULL;
    
    if ([object isKindOfClass:[NSData class]]) {
        description = magic_buffer(cookie, [object bytes], [object length]);
    } else if ([object isKindOfClass:[NSString class]]) {
        description = magic_file(cookie, [object UTF8String]);
    } else {
        NSException *exception = [NSException exceptionWithName:@"MagicKit" reason:@"Not a valid object (data / path string)" userInfo:nil];
        [exception raise];
    }
    
    return [NSString stringWithUTF8String:description];
}

#pragma mark -
#pragma mark Convenience methods

+ (NSString *)mimeTypeForFileAtPath:(NSString *)path {
    return [MagicKit descriptionForObject:path decompress:NO mimeType:YES];
}

+ (NSString *)descriptionForFileAtPath:(NSString *)path {
    return [MagicKit descriptionForObject:path decompress:NO mimeType:NO];
}

+ (NSString *)mimeTypeForData:(NSData *)data {
    return [MagicKit descriptionForObject:data decompress:NO mimeType:YES];
}

+ (NSString *)descriptionForData:(NSData *)data {
    return [MagicKit descriptionForObject:data decompress:NO mimeType:NO];
}

+ (NSString *)descriptionForData:(NSData *)data decompress:(BOOL)decompress mimeType:(BOOL)mimeType {
    return [MagicKit descriptionForObject:data decompress:decompress mimeType:mimeType];
}

+ (NSString *)descriptionForFileAtPath:(NSString *)path decompress:(BOOL)decompress mimeType:(BOOL)mimeType {
    return [MagicKit descriptionForObject:path decompress:decompress mimeType:mimeType];
}

@end
