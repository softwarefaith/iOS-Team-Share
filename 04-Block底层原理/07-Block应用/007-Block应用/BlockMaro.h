//
//  BlockMaro.h
//  007-Block应用
//
//  Created by 蔡杰 on 2018/8/29.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

#ifndef BlockMaro_h
#define BlockMaro_h

#define BLOCK_SCOPE __block

/**
 * Defines a block type.  Will work whether or not the compiler natively
 * supports blocks.
 */
#define DEFINE_BLOCK_TYPE(name, retTy, argTys, ...) \
typedef retTy(^name)(argTys, ## __VA_ARGS__)

#define DEFINE_BLOCK_TYPE_NO_ARGS(name, retTy) \
typedef retTy(^name)()


/**
 * Calls a block.  Works irrespective of whether the compiler supports blocks.
 */
#define CALL_BLOCK(block, args, ...) block(args, ## __VA_ARGS__)

/**
 * Calls a block without arguments.
 */
#define CALL_BLOCK_NO_ARGS(block) block()


#define DEFINE_BLOCK_TYPE_STRUCT(name, retTy, argTys, ...) \
typedef struct {\
void *isa;\
int flags;\
int reserved;\
retTy (*invoke)(void*, argTys, ## __VA_ARGS__);\
} *name

#define DEFINE_BLOCK_TYPE_NO_ARGS_STRUCT(name, retTy) \
typedef struct {\
void *isa;\
int flags;\
int reserved;\
retTy (*invoke)(void*);\
} *name

#define CALL_BLOCK_STRUCT(block, args, ...) block->invoke(block, args, ## __VA_ARGS__)

#define CALL_BLOCK_NO_ARGS_STRUCT(block) block->invoke(block)


#endif /* BlockMaro_h */
