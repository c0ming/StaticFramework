//
//  RNPatch.m
//  RNPatchSDK
//
//  Created by c0ming on 2016/9/29.
//  Copyright © 2016年 c0ming. All rights reserved.
//

#import "RNPatch.h"

#include "bspatch.h"

@implementation RNPatch

-(void)sayHello {
    NSLog(@"hallo...");
}

+ (void)applyPatch:(NSString * _Nonnull)patchFilePath fromOldFile:(NSString * _Nonnull)oldFilePath toNewFile:(NSString * _Nonnull)newFilePath {
    BOOL patchFileExists = [[NSFileManager defaultManager] fileExistsAtPath:patchFilePath];
    BOOL oldFileExists = [[NSFileManager defaultManager] fileExistsAtPath:oldFilePath];
    BOOL isNewFileWritable = [[NSFileManager defaultManager] isWritableFileAtPath:[newFilePath stringByDeletingLastPathComponent]];
    
    if (!patchFileExists) {
        NSLog(@"[RNPatchSDK] Patch file %@ not found.", patchFilePath);
        return;
    }
    
    if (!oldFileExists) {
        NSLog(@"[RNPatchSDK] Old file %@ not found.", oldFilePath);
        return;
    }
    
    if (!isNewFileWritable) {
        NSLog(@"[RNPatchSDK] New file %@ is not writeable.", newFilePath);
        return;
    }
    
    if ([patchFilePath isEqualToString:oldFilePath] || [patchFilePath isEqualToString:newFilePath] || [oldFilePath isEqualToString:newFilePath]) {
        NSLog(@"[RNPatchSDK] File path cannot be the same.");
        return;
    }
    
    bspatch(oldFilePath.UTF8String, patchFilePath.UTF8String, newFilePath.UTF8String);
}

@end
