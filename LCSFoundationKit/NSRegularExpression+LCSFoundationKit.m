//
//  NSRegularExpression+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSRegularExpression+LCSFoundationKit.h"

#import "NSString+LCSFoundationKit.h"

@implementation NSRegularExpression (LCSFoundationKit)

+ (instancetype)emailRE
{
    static NSRegularExpression *emailRE;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        emailRE = [NSRegularExpression re:@"(?=(?:mailto:)?)([\\w.%+-]+)@([a-z0-9.-]+)\\.(ac|ad|ae|aero|af|ag|ai|al|am|an|ao|aq|ar|arpa|as|asia|at|au|aw|ax|az|ba|bb|bd|be|bf|bg|bh|bi|biz|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cat|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|com|coop|cr|cu|cv|cw|cx|cy|cz|de|dj|dk|dm|do|dz|ec|edu|ee|eg|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gg|gh|gi|gl|gm|gn|gov|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|im|in|info|int|io|iq|ir|is|it|je|jm|jo|jobs|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|me|mg|mh|mil|mk|ml|mm|mn|mo|mobi|mp|mq|mr|ms|mt|mu|museum|mv|mw|mx|my|mz|na|name|nc|ne|net|nf|ng|ni|nl|no|np|nr|nu|nz|om|org|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|pro|ps|pt|pw|py|qa|re|ro|rs|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|st|su|sv|sx|sy|sz|tc|td|tel|tf|tg|th|tj|tk|tl|tm|tn|to|tp|tr|travel|tt|tv|tw|tz|ua|ug|uk|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|xn|xxx|ye|yt|za|zm|zw)(?=[^a-z]|$)"];
    });
    
    return emailRE;
}

+ (instancetype)webUrlRE
{
    static NSRegularExpression *webUrlRE;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        webUrlRE = [NSRegularExpression re:@"(?:(?:https?://)|www\\.)([\\w.%+-]+)\\.(ac|ad|ae|aero|af|ag|ai|al|am|an|ao|aq|ar|arpa|as|asia|at|au|aw|ax|az|ba|bb|bd|be|bf|bg|bh|bi|biz|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cat|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|com|coop|cr|cu|cv|cw|cx|cy|cz|de|dj|dk|dm|do|dz|ec|edu|ee|eg|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gg|gh|gi|gl|gm|gn|gov|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|im|in|info|int|io|iq|ir|is|it|je|jm|jo|jobs|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|me|mg|mh|mil|mk|ml|mm|mn|mo|mobi|mp|mq|mr|ms|mt|mu|museum|mv|mw|mx|my|mz|na|name|nc|ne|net|nf|ng|ni|nl|no|np|nr|nu|nz|om|org|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|pro|ps|pt|pw|py|qa|re|ro|rs|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|st|su|sv|sx|sy|sz|tc|td|tel|tf|tg|th|tj|tk|tl|tm|tn|to|tp|tr|travel|tt|tv|tw|tz|ua|ug|uk|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|xn|xxx|ye|yt|za|zm|zw)(?:(/\\S*)|(?=[^a-z]|$))"];
    });
    
    return webUrlRE;
}

+ (instancetype)re:(NSString*)pattern
{
    return [NSRegularExpression re:pattern options:NSRegularExpressionCaseInsensitive];
}

+ (instancetype)re:(NSString*)pattern options:(NSRegularExpressionOptions)options
{
    NSParameterAssert(pattern != nil);
    
    NSError *error;
    NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:pattern 
                                                                        options:options 
                                                                          error:&error];
    
    if (error) {
        @throw [NSException exceptionWithName:@"LcRegularExpressionExcption"
                                                         reason:@"Regular expression failed to compile" 
                                                       userInfo:[NSDictionary dictionaryWithObject:error forKey:@"error"]];
    }
    else {
        return re;
    }
}

- (BOOL)matchesCompleteString:(NSString *)string
{
    NSParameterAssert(string != nil);
    
    NSTextCheckingResult *result = [self firstMatchInString:string
                                                    options:NSMatchingAnchored
                                                      range:string.completeRange];
    
    return (NSEqualRanges(result.range, string.completeRange));
}

- (BOOL)matchesString:(NSString*)string
{
    return [self matchesString:string options:0];
}


- (BOOL)matchesString:(NSString*)string options:(NSMatchingOptions)options
{
    NSParameterAssert(string != nil);
    
    if ([self firstMatchInString:string options:options range:string.completeRange]) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
