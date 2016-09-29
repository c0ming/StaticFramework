//
//  RNPatch.h
//  RNPatchSDK
//
//  Created by c0ming on 2016/9/29.
//  Copyright © 2016年 c0ming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RNPatch : NSObject

- (void)sayHello;

+ (void)applyPatch:(NSString * _Nonnull)patchFilePath fromOldFile:(NSString * _Nonnull)oldFilePath toNewFile:(NSString * _Nonnull)newFilePath;

@end
