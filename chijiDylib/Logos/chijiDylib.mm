#line 1 "/Users/rozbo/code/iosre/chiji/chijiDylib/Logos/chijiDylib.xm"
#import <Metal/Metal.h>
#import <objc/runtime.h>
#import <mach-o/dyld.h>




#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class AGXA11FamilyRenderContext; 


#line 7 "/Users/rozbo/code/iosre/chiji/chijiDylib/Logos/chijiDylib.xm"
static void (*_logos_orig$test1$AGXA11FamilyRenderContext$drawIndexedPrimitives$indexCount$indexType$indexBuffer$indexBufferOffset$instanceCount$baseVertex$baseInstance$)(_LOGOS_SELF_TYPE_NORMAL AGXA11FamilyRenderContext* _LOGOS_SELF_CONST, SEL, MTLPrimitiveType, NSUInteger, MTLIndexType, id<MTLBuffer>, NSUInteger, NSUInteger, NSInteger, NSUInteger); static void _logos_method$test1$AGXA11FamilyRenderContext$drawIndexedPrimitives$indexCount$indexType$indexBuffer$indexBufferOffset$instanceCount$baseVertex$baseInstance$(_LOGOS_SELF_TYPE_NORMAL AGXA11FamilyRenderContext* _LOGOS_SELF_CONST, SEL, MTLPrimitiveType, NSUInteger, MTLIndexType, id<MTLBuffer>, NSUInteger, NSUInteger, NSInteger, NSUInteger); 










static void _logos_method$test1$AGXA11FamilyRenderContext$drawIndexedPrimitives$indexCount$indexType$indexBuffer$indexBufferOffset$instanceCount$baseVertex$baseInstance$(_LOGOS_SELF_TYPE_NORMAL AGXA11FamilyRenderContext* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, MTLPrimitiveType primitiveType, NSUInteger indexCount, MTLIndexType indexType, id<MTLBuffer> indexBuffer, NSUInteger indexBufferOffset, NSUInteger instanceCount, NSInteger baseVertex, NSUInteger baseInstance){







if(instanceCount>1){
return;
}
























return _logos_orig$test1$AGXA11FamilyRenderContext$drawIndexedPrimitives$indexCount$indexType$indexBuffer$indexBufferOffset$instanceCount$baseVertex$baseInstance$(self, _cmd, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount, baseVertex, baseInstance);
}





void hook_metal(){
    while(true){
        if(objc_getClass("AGXA11FamilyRenderContext")){

            {Class _logos_class$test1$AGXA11FamilyRenderContext = objc_getClass("AGXA11FamilyRenderContext"); MSHookMessageEx(_logos_class$test1$AGXA11FamilyRenderContext, @selector(drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:), (IMP)&_logos_method$test1$AGXA11FamilyRenderContext$drawIndexedPrimitives$indexCount$indexType$indexBuffer$indexBufferOffset$instanceCount$baseVertex$baseInstance$, (IMP*)&_logos_orig$test1$AGXA11FamilyRenderContext$drawIndexedPrimitives$indexCount$indexType$indexBuffer$indexBufferOffset$instanceCount$baseVertex$baseInstance$);} break;
        }
    }
}

static __attribute__((constructor)) void _logosLocalCtor_960c3164(int __unused argc, char __unused **argv, char __unused **envp){
    NSLog(@"大吉大利，晚上吃鸡！");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSLog(@"6秒后hook");
    hook_metal();
    });
}
