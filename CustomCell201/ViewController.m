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

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, ProductCellDelegate>
@property NSMutableArray *items;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;


@end

@implementation ViewController

/*-(void)incQuantity:(NSString *)productCode{

    [self.cart incQuantity1:productCode];

    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}



-(void)decQuantity:(NSString *)productCode{
    [self.cart decQuantity1:productCode];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/

-(void)addItem:(id)sender
{
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog]productAt:(int)indexPath.row];
    
    // 핵심
    [self.cart addProduct:product];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"알림" message:@"카트에 들어갔습니다" delegate:nil cancelButtonTitle:@"닫기" otherButtonTitles:@"확인", nil];
    [alert show];
    
<<<<<<< HEAD
    
=======
>>>>>>> 838e092d57e63a51dc8bba3175e0087a2668c40d
  /*  NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];*/
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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
    
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        cell.delegate = self;
        Product *product = [[Catalog defaultCatalog]productAt:(int)indexPath.row];
        [cell setProductInfo:product];
        
        
        return cell;
    


 
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //제품 상세보기 뷰 컨트롤러
    ProductDetailViewController *detailVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *selectedProduct = [[Catalog defaultCatalog] productAt:(int)indexPath.row];
    
    
    
    //제품의 코드를 넘겨준다.
    detailVC.productCode = selectedProduct.code;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.cart= [Cart defaultCart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
