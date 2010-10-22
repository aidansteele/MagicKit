/*
 *  main.m
 *  MagicKit
 *
 *  Created by Aidan Steele on 10/10/10.
 *  Copyright 2010 Glass Echidna. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import <MagicKit/MagicKit.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    if (argc > 1) {
        NSString *filePath = [NSString stringWithUTF8String:argv[1]];
        GEMagicResult *result = [GEMagicKit magicForFileAtPath:filePath];
        
        NSLog(@"MIME Type: %@", result.mimeType);
        NSLog(@"Description %@", result.description);
        NSLog(@"UTIs: %@", result.uniformTypeHierarchy);
    } else {
        NSLog(@"Supply a path to the file whose type you wish to determine.");
    }

    
    
    [pool drain];
    return 0;
}