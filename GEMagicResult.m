//
//  MagicResult.m
//  MagicKit
//
//  Created by Aidan Steele on 22/10/10.
//  Copyright 2010 Glass Echidna. All rights reserved.
//

#import "GEMagicResult.h"
#import "MagicKitPrivate.h"

@implementation GEMagicResult

@synthesize mimeType;
@synthesize description;
@synthesize uniformTypeHierarchy;
@dynamic uniformType;

- (id)initWithMimeType:(NSString *)aMimeType description:(NSString *)aDescription typeHierarchy:(NSArray *)typeHierarchy {
    if (self = [super init]) {
        self->mimeType = [aMimeType retain];
        self->description = [aDescription retain];
        self->uniformTypeHierarchy = [typeHierarchy retain];
    }
    
    return self;
}

- (NSString *)uniformType {
    return [self.uniformTypeHierarchy objectAtIndex:0];
}

@end
