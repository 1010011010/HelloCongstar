#import "NSURL+Extensions.h"

@implementation NSURL (QueryItem)

- (NSURL *)URLByAppendingQueryItemWithName:(NSString *)name value:(NSString *)value {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:self.absoluteString];
    if (!urlComponents) {
        return self;
    }
    
    NSMutableArray<NSURLQueryItem *> *queryItems = urlComponents.queryItems ? [urlComponents.queryItems mutableCopy] : [NSMutableArray new];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:name value:value];
    [queryItems addObject:queryItem];
    urlComponents.queryItems = queryItems;
    
    NSURL *url = urlComponents.URL;
    if (!url) {
        return self;
    }
    
    return url;
}

@end
