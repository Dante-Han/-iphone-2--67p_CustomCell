//
//  ViewController.m
//  CustomCell201
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h" 
#import "Product.h"
#import "Catalog.h"
#import "CartCell.h"
#import "CartItem.h"
#import "CartDelegate.h"
#import "Cart.h"

#import "ProductDetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, CartDelegate>
@property NSMutableArray *items;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;


@end

@implementation ViewController

-(void)incQuantity:(NSString *)productCode{

    [self.cart incQuantity1:productCode];

    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}



-(void)decQuantity:(NSString *)productCode{
    [self.cart decQuantity1:productCode];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)addItem:(id)sender
{
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog]productAt:indexPath.row];
    
    // 핵심
    [self.cart addProduct:product];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(0==section)
        return [[Catalog defaultCatalog]numberOfProduct];
    else
        return self.cart.items.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return (0 == section) ? @"Product List" : @"Cart";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(0==indexPath.section){
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        cell.delegate = self;
        Product *product = [[Catalog defaultCatalog]productAt:indexPath.row];
        [cell setProductInfo:product];
        
        
        return cell;
    }
    else{
        CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        cell.delegate = self;
        CartItem *cartItem = self.cart.items[indexPath.row];
        [cell setCartItem:cartItem];
        
        return cell;
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //제품 상세보기 뷰 컨트롤러
    ProductDetailViewController *detailVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *selectedProduct = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    
    
    //제품의 코드를 넘겨준다.
    detailVC.productCode = selectedProduct.code;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.cart = [[Cart alloc] init];
    self.cart.items = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
