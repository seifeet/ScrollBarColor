//
//  ATViewController.m
//  ScrollBarColor
//
//  Created by AT on 3/28/14.
//  Copyright (c) 2014 AT. All rights reserved.
//

#import "ATViewController.h"

@interface ATViewController ()
<UIScrollViewDelegate>

@end

@implementation ATViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height)];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2.0f, self.view.bounds.size.height * 2.0f);
    [self.view addSubview:scrollView];

    float width = 50.0f;
    float height = 50.0f;
    float xPos = 10.0f;
    float yPos = 10.0f;

    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    view1.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:view1];

    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width + xPos, yPos, width, height)];
    view2.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:view2];

    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(xPos, self.view.bounds.size.height + yPos, width, height)];
    view3.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview:view3];

    scrollView.delegate = self;
}

- (void)changeScrollBarColorFor:(UIScrollView *)scrollView
{
    for ( UIView *view in scrollView.subviews ) {

        if (view.tag == 0 && [view isKindOfClass:UIImageView.class])
        {
            NSLog(@" --------- %f - %f - %f - %f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);

            UIImageView *imageView = (UIImageView *)view;
            imageView.backgroundColor = [UIColor redColor];
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self changeScrollBarColorFor:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
