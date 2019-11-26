//
//  LCCollectionViewController.m
//  TestPods
//
//  Created by Long on 2019/11/25.
//  Copyright © 2019 Long. All rights reserved.
//
//  参考链接： https://www.jianshu.com/p/db55bd5f5aeb
//

#import "LCCollectionViewController.h"
#import "LCCollectionReusableView.h"
#import "LCCollectionViewCell.h"
#import "UIColor+Random.h"
#import <SDWebImage/SDWebImage.h>

static NSString *const CollectionViewCellReuseIdentifier = @"CollectionViewCellReuseIdentifier";
static NSString *const CollectionViewHeaderReuseIdentifier = @"CollectionViewCellReuseIdentifier";
static NSString *const CollectionViewFooterReuseIdentifier = @"CollectionViewCellReuseIdentifier";


@interface LCCollectionViewController () <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDragDelegate, UICollectionViewDropDelegate>

@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UICollectionViewFlowLayout *cellectViewFlowLayout;
@property (nonatomic, strong)NSMutableArray *datas;

@end

@implementation LCCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:self.collectionView];
    
    //1. 手动实现cell的拖拽功能
//    UIGestureRecognizer *gestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(reorderCollectionView:)];
//    [self.collectionView addGestureRecognizer:gestureRecognizer];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.datas.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.datas[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellReuseIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = UIColor.randomColor;
//    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//
//    UILabel *label = [[UILabel alloc] init];
//    label.frame = CGRectMake(10, cell.frame.size.height/2, cell.frame.size.width, 30);
//    label.textColor = UIColor.blackColor;
//    label.text = [NSString stringWithFormat:@"%@-%@", @(indexPath.section), @(indexPath.row)];
//    [cell addSubview:label];
//    cell.imageView.image = [UIImage imageNamed:@"singlePic"];
    
    if (indexPath.section == 0) {
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://patpatwebstatic.s3.us-west-2.amazonaws.com/origin/other/cms/position/5ddb8dd3f2fcb.jpg"]];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"singlePic"];
    }
    cell.label.text = [NSString stringWithFormat:@"%@-%@", @(indexPath.section), @(indexPath.row)];

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    LCCollectionReusableView *reuseableView;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        reuseableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewHeaderReuseIdentifier forIndexPath:indexPath];
        reuseableView.label.textAlignment = NSTextAlignmentCenter;
        reuseableView.label.text = [NSString stringWithFormat:@"Section %li", indexPath.section];
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        reuseableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionViewFooterReuseIdentifier forIndexPath:indexPath];
        reuseableView.label.textAlignment = NSTextAlignmentNatural;
        reuseableView.label.text = [NSString stringWithFormat:@"Section %li have %li items", indexPath.section, [collectionView numberOfItemsInSection:indexPath.section]];
    }
    return reuseableView;
}

//- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}
//
//- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
//    NSString *item = self.datas[sourceIndexPath.section][sourceIndexPath.row];
//    [self.datas[sourceIndexPath.section] removeObjectAtIndex:sourceIndexPath.row];
//    [self.datas[destinationIndexPath.section] insertObject:item atIndex:destinationIndexPath.row];
//
//    [collectionView reloadItemsAtIndexPaths:collectionView.indexPathsForVisibleItems];
//}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(153, 128);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return section == 0 ? CGSizeMake(40, 40) : CGSizeMake(45, 45);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(35, 35);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

#pragma mark - UICollectionViewDragDelegate
- (NSArray<UIDragItem *> *)collectionView:(UICollectionView *)collectionView itemsForBeginningDragSession:(id<UIDragSession>)session atIndexPath:(NSIndexPath *)indexPath {
    NSString *imageName = [self.datas[indexPath.section] objectAtIndex:indexPath.row];
    NSItemProvider *itemProvider = [[NSItemProvider alloc] initWithObject:imageName];
    UIDragItem *dragItem = [[UIDragItem alloc] initWithItemProvider:itemProvider];
    dragItem.localObject = imageName;
    return @[dragItem];
}

- (UIDragPreviewParameters *)collectionView:(UICollectionView *)collectionView dragPreviewParametersForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIDragPreviewParameters *previewParameters = [[UIDragPreviewParameters alloc] init];
    LCCollectionViewCell *cell = (LCCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    previewParameters.visiblePath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:10];
    previewParameters.backgroundColor =  UIColor.clearColor;
    return previewParameters;
}

#pragma mark - UICollectionViewDropDelegate
// 是否可以处理移动
- (BOOL)collectionView:(UICollectionView *)collectionView canHandleDropSession:(id<UIDropSession>)session {
    return [session canLoadObjectsOfClass:[NSString class]];
}

// 拖动过程中不断反馈item位置。
- (UICollectionViewDropProposal *)collectionView:(UICollectionView *)collectionView dropSessionDidUpdate:(id<UIDropSession>)session withDestinationIndexPath:(nullable NSIndexPath *)destinationIndexPath {
    UICollectionViewDropProposal *dropProposal;
    if (session.localDragSession) {
        dropProposal = [[UICollectionViewDropProposal alloc] initWithDropOperation:UIDropOperationMove intent:UICollectionViewDropIntentInsertAtDestinationIndexPath];
    } else {
        dropProposal = [[UICollectionViewDropProposal alloc] initWithDropOperation:UIDropOperationCopy intent:UICollectionViewDropIntentInsertAtDestinationIndexPath];
    }
    return dropProposal;
}

- (void)collectionView:(UICollectionView *)collectionView performDropWithCoordinator:(id<UICollectionViewDropCoordinator>)coordinator {
    NSIndexPath *destinationIndexPath = coordinator.destinationIndexPath ? coordinator.destinationIndexPath : [NSIndexPath indexPathForItem:0 inSection:0];
    
    if (coordinator.items.count == 1 && coordinator.items.firstObject.sourceIndexPath) {
        NSIndexPath *sourceIndexPath = coordinator.items.firstObject.sourceIndexPath;
        
        [collectionView performBatchUpdates:^{
            NSString *imageName = coordinator.items.firstObject.dragItem.localObject;
            [self.datas[sourceIndexPath.section] removeObjectAtIndex:sourceIndexPath.item];
            [self.datas[destinationIndexPath.section] insertObject:imageName atIndex:destinationIndexPath.item];
            
            [collectionView moveItemAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
        } completion:^(BOOL finished) {
            [coordinator dropItem:coordinator.items.firstObject.dragItem toItemAtIndexPath:destinationIndexPath];
        }];
    }
}

#pragma mark - UIGestureRecognizer
- (void)reorderCollectionView:(UILongPressGestureRecognizer *)recognizer {
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint point = [recognizer locationInView:self.collectionView];
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
            if(indexPath){
                [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
            }
        }
        break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGPoint currentPoint = [recognizer locationInView:self.collectionView];
            [self.collectionView updateInteractiveMovementTargetPosition:currentPoint];
        }
        break;
            
        case UIGestureRecognizerStateEnded:
        {
            [self.collectionView endInteractiveMovement];
        }
        break;
            
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

#pragma mark - Getter/Setter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.cellectViewFlowLayout];
        _collectionView.backgroundColor = UIColor.clearColor;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        //手动拖拽代理
        _collectionView.dragInteractionEnabled = YES;
        _collectionView.dragDelegate = self;
        _collectionView.dropDelegate = self;
        
        [_collectionView registerClass:LCCollectionViewCell.class forCellWithReuseIdentifier:CollectionViewCellReuseIdentifier];
        [_collectionView registerClass:LCCollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewHeaderReuseIdentifier];
        [_collectionView registerClass:LCCollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionViewFooterReuseIdentifier];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)cellectViewFlowLayout {
    if (!_cellectViewFlowLayout) {
        _cellectViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        _cellectViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _cellectViewFlowLayout;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        NSMutableArray *section1 = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"1",@"2",@"3",@"4",@"5",@"6", nil];
        NSMutableArray *section2 = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"A",@"B",@"C",@"D",@"E",@"F", nil];
        _datas = [NSMutableArray arrayWithObjects:section1,section2, nil];
    }
    return _datas;
}


@end
