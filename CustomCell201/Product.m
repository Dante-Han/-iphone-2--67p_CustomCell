//
//  Product.m
//  CustomCell201
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Product.h"

@implementation Product

-(BOOL)isEqualProduct:(NSString *)productCode{
    return [self.code isEqualToString:productCode];
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+(id)product:(NSString *)name code:(NSString *)code price:(NSString *)price image:(NSString *)image url:(NSString *)url{
    
    Product *item = [[Product alloc]init];

    
    item.name = name;
    item.price = price;
    item.imageName = image;
    item.code = code;
    item.url = url;
    
    return item;
}



/*
+(id)product:(NSString *)name price:(NSString *)price image:(NSString *)image{
    Product *item = [[Product alloc]init];
    item.name = name;
    item.price = price;
    item.imageName = image;
    
    return item;
}
 */
@end
