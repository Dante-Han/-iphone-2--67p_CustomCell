//
//  CartItem.h
//  CustomCell201
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface CartItem : NSObject

@property (weak, nonatomic)Product *product; // 구입 제품 정보
@property (nonatomic) int quantity; // 구입 수량


@end
