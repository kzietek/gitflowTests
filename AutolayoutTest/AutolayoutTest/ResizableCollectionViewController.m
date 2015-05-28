//
//  ResizableCollectionViewController.m
//  AutolayoutTest
//
//  Created by Kamil Zietek on 28.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import "ResizableCollectionViewController.h"
#import "ResizableCollectionViewCell.h"

@interface ResizableCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation ResizableCollectionViewController

static NSString * const reuseIdentifier = @"cell1";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDelegateFlowLayout>

/*
 
 // MARK: - UICollectionViewFlowLayout Delegate
 func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
 // Set up desired width
 let targetWidth: CGFloat = (self.collectionView.bounds.width - 3 * kHorizontalInsets) / 2
 
 // Use fake cell to calculate height
 let reuseIdentifier = kCellIdentifier
 var cell: MyCollectionViewCell? = self.offscreenCells[reuseIdentifier] as? MyCollectionViewCell
 if cell == nil {
 cell = NSBundle.mainBundle().loadNibNamed("MyCollectionViewCell", owner: self, options: nil)[0] as? MyCollectionViewCell
 self.offscreenCells[reuseIdentifier] = cell
 }
 
 // Config cell and let system determine size
 cell!.configCell(titleData[indexPath.item] as! String, content: contentData[indexPath.item] as! String, titleFont: fontArray[indexPath.item] as! String, contentFont: fontArray[indexPath.item] as! String)
 
 // Cell's size is determined in nib file, need to set it's width (in this case), and inside, use this cell's width to set label's preferredMaxLayoutWidth, thus, height can be determined, this size will be returned for real cell initialization
 cell!.bounds = CGRectMake(0, 0, targetWidth, cell!.bounds.height)
 cell!.contentView.bounds = cell!.bounds
 
 // Layout subviews, this will let labels on this cell to set preferredMaxLayoutWidth
 cell!.setNeedsLayout()
 cell!.layoutIfNeeded()
 
 var size = cell!.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
 // Still need to force the width, since width can be smalled due to break mode of labels
 size.width = targetWidth
 return size
 }
 
 */

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    static CGFloat baseSize = 50;
    return CGSizeMake(baseSize * (indexPath.row + 1), baseSize);
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ResizableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSString *text = [NSString stringWithFormat:@"Label%ld",(long)indexPath.row];
    NSString *cellText = text;
    for (NSInteger i = 0; i < indexPath.row; i++) {
        cellText = [NSString stringWithFormat:@"%@ %@",cellText,text];
    }
    
    cell.vLabel.text = cellText;
    [cell layoutSubviews];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
