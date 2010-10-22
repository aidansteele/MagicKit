//
//  MagicResult.h
//  MagicKit
//
//  Created by Aidan Steele on 22/10/10.
//  Copyright 2010 Glass Echidna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicKit/MagicKit.h>

@interface GEMagicResult : NSObject {
    NSString *mimeType;
    NSString *description;
    NSArray *uniformTypeHierarchy;
}

@property (nonatomic, readonly, retain) NSString *mimeType;
@property (nonatomic, readonly, retain) NSString *description;
@property (nonatomic, readonly, retain) NSString *uniformType;
@property (nonatomic, readonly, retain) NSArray *uniformTypeHierarchy;

@end
