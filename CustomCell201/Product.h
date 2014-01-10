//
//  Product.h
//  CustomCell201
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *price;
@property (strong,nonatomic) NSString *imageName;
@property (strong,nonatomic) NSString *code;
@property (strong,nonatomic) NSString *url;
+(id)product:(NSString *)name code:(NSString *)code  price:(NSString *)price image:(NSString *)image url:(NSString *)url;

-(BOOL)isEqualProduct:(NSString *)productCode;

@end
