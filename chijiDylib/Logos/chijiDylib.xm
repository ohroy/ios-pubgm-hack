#import <Metal/Metal.h>
#import <objc/runtime.h>
#import <mach-o/dyld.h>



%group test1
%hook AGXA11FamilyRenderContext
// - (void)drawIndexedPrimitives:(MTLPrimitiveType)primitiveType indexCount:(NSUInteger)indexCount indexType:(MTLIndexType)indexType indexBuffer:(id <MTLBuffer>)indexBuffer indexBufferOffset:(NSUInteger)indexBufferOffset instanceCount:(NSUInteger)instanceCount{
//     HBLogInfo(@"drawIndexedPrimitives1");
//     return %orig;
// }




//祝我吃鸡吧
- (void)drawIndexedPrimitives:(MTLPrimitiveType)primitiveType indexCount:(NSUInteger)indexCount indexType:(MTLIndexType)indexType indexBuffer:(id<MTLBuffer>)indexBuffer indexBufferOffset:(NSUInteger)indexBufferOffset instanceCount:(NSUInteger)instanceCount baseVertex:(NSInteger)baseVertex baseInstance:(NSUInteger)baseInstance{
//HBLogInfo(@"drawIndexedPrimitives2");
//instanceCount=instanceCount;
//indexCount=indexCount+1;
// [self setBlendColorRed:1 green:1 blue:1 alpha:1];
//
// [self setTileHeight:100];
// [self settileWidth:100];
if(instanceCount>1){
return;
}
// if(!willRender){
// return;
// }
// if(indexBuffer.length<10000&&indexBuffer.length>8000){
//     //[self setDepthClipMode:MTLDepthClipModeClamp];
//     [self setDepthStencilState:myDepStencilState];
//     HBLogInfo(@"透视%lu",indexCount);
//     return %orig;;
// }
//     if(indexBufferOffset==0){
//         return %orig;
//     }
// //下半身1000-2000
// //上半身小于1000
//     if( myDepStencilState){
//         HBLogInfo(@"透视%lu",indexCount);
//         //HBLogInfo(@"透视");
//         //return;
//         [self setDepthStencilState:myDepStencilState];
//     }
// if(oldDepStencilState){
//     [self setDepthStencilState:oldDepStencilState];
// }

return %orig;
}

//-[FMetalDebugRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:]:
%end
%end

void hook_metal(){
    while(true){
        if(objc_getClass("AGXA11FamilyRenderContext")){
            %init(test1)
            break;
        }
    }
}

%ctor{
    NSLog(@"大吉大利，晚上吃鸡！");
    //
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSLog(@"6秒后hook");
    hook_metal();
    });
}
