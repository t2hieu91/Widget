//
//  SharedStorage.m
//  Widget
//
//  Created by Trung Hieu on 9/24/20.
//

#import "SharedStorage.h"
#import "React/RCTLog.h"

@implementation SharedStorage

RCT_EXPORT_MODULE();

// We can send back a promise to our JavaScript environment :)
RCT_EXPORT_METHOD(set:(NSString *)data
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  @try{
    NSUserDefaults *shared = [[NSUserDefaults alloc]initWithSuiteName:@"group.native.example.Widget.WidgetExtension"];
    [shared setObject:data forKey:@"data"];
    [shared synchronize];
    resolve(@"true");
  }@catch(NSException *exception){
    reject(@"get_error",exception.reason, nil);
  }

}

@end
