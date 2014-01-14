//
//  Cart.h
//  CustomCell201
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartItem.h"
#import "Product.h"

@interface Cart : NSObject

@property NSMutableArray *items;
// 카트에 제품 추가
-(void)addProduct:(Product*)item;


-(void)incQuantity:(NSString *)productCode;
-(void)decQuantity:(NSString *)productCode;
-(CartItem *)cartItemWith:(NSString *)productCode;



+(id)defaultCart;
@end
