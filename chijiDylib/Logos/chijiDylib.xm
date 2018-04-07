
#import <Metal/Metal.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <mach-o/dyld.h>
NSUInteger value = 1;
@interface IOSViewController : UIViewController{

}
- (void)sliderValueChanged:(id)sender;

@end

%group addUISlider
%hook IOSViewController
- (void)loadView {
%orig;
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 - 5, 30, [UIScreen mainScreen].bounds.size.width / 3  + 10, 20)];
slider.minimumValue = 1;
slider.maximumValue = 100;
slider.value = 1;
slider.continuous = YES;
[slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
[self.view addSubview:slider];
});
}
%new
-(void)sliderValueChanged:(id)sender{
UISlider *slider = (UISlider *)sender;
value =  slider.value;
}
%end
%end

%group A7
%hook AGXA7FamilyRenderContext

- (void)drawIndexedPrimitives:(MTLPrimitiveType)primitiveType indexCount:(NSUInteger)indexCount indexType:(MTLIndexType)indexType indexBuffer:(id<MTLBuffer>)indexBuffer indexBufferOffset:(NSUInteger)indexBufferOffset instanceCount:(NSUInteger)instanceCount baseVertex:(NSInteger)baseVertex baseInstance:(NSUInteger)baseInstance{
if(instanceCount > value && value > 0){
return;
}

return %orig;
}

%end
%end

%group A8
%hook AGXA8FamilyRenderContext

- (void)drawIndexedPrimitives:(MTLPrimitiveType)primitiveType indexCount:(NSUInteger)indexCount indexType:(MTLIndexType)indexType indexBuffer:(id<MTLBuffer>)indexBuffer indexBufferOffset:(NSUInteger)indexBufferOffset instanceCount:(NSUInteger)instanceCount baseVertex:(NSInteger)baseVertex baseInstance:(NSUInteger)baseInstance{
if(instanceCount > value && value > 0){
return;
}

return %orig;
}

%end
%end

%group A9
%hook AGXA9FamilyRenderContext

- (void)drawIndexedPrimitives:(MTLPrimitiveType)primitiveType indexCount:(NSUInteger)indexCount indexType:(MTLIndexType)indexType indexBuffer:(id<MTLBuffer>)indexBuffer indexBufferOffset:(NSUInteger)indexBufferOffset instanceCount:(NSUInteger)instanceCount baseVertex:(NSInteger)baseVertex baseInstance:(NSUInteger)baseInstance{
if(instanceCount > value &&value > 0){
return;
}

return %orig;
}

%end
%end

%group A10
%hook AGXA10FamilyRenderContext

- (void)drawIndexedPrimitives:(MTLPrimitiveType)primitiveType indexCount:(NSUInteger)indexCount indexType:(MTLIndexType)indexType indexBuffer:(id<MTLBuffer>)indexBuffer indexBufferOffset:(NSUInteger)indexBufferOffset instanceCount:(NSUInteger)instanceCount baseVertex:(NSInteger)baseVertex baseInstance:(NSUInteger)baseInstance{
if(instanceCount > value &&value > 0){
return;
}

return %orig;
}

%end
%end

%group A11
%hook AGXA11FamilyRenderContext

- (void)drawIndexedPrimitives:(MTLPrimitiveType)primitiveType indexCount:(NSUInteger)indexCount indexType:(MTLIndexType)indexType indexBuffer:(id<MTLBuffer>)indexBuffer indexBufferOffset:(NSUInteger)indexBufferOffset instanceCount:(NSUInteger)instanceCount baseVertex:(NSInteger)baseVertex baseInstance:(NSUInteger)baseInstance{
if(instanceCount > value &&value > 0){
return;
}

return %orig;
}

%end
%end

void hook_metal(){
while(true){
if(objc_getClass("AGXA7FamilyRenderContext")){
%init(A7)
NSLog(@"A7");

break;
}else if(objc_getClass("AGXA8FamilyRenderContext")){
%init(A8)
NSLog(@"A8");

break;
}else if(objc_getClass("AGXA9FamilyRenderContext")){
%init(A9)
NSLog(@"A9");

break;
}else if(objc_getClass("AGX10FamilyRenderContext")){
%init(A10)
NSLog(@"A10");

break;
}else if(objc_getClass("AGXA11FamilyRenderContext")){
%init(A11)
NSLog(@"A11");

break;
}
}
}

%ctor{
%init(addUISlider)
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

hook_metal();
});
}

