ScrollBarColor
==============

iOS: Changing UIScrollView scrollbar color to a custom color

There is no “legal” way of changing a scrollbar color to a custom color.

Apple does provide some default color schemes:

UIScrollViewIndicatorStyleDefault:

The default style of scroll indicator, which is black with a white border. This style is good against any content background.

UIScrollViewIndicatorStyleBlack:

A style of indicator which is black and smaller than the default style. This style is good against a white content background.

UIScrollViewIndicatorStyleWhite:

A style of indicator is white and smaller than the default style. This style is good against a black content background

But who wants that?

Apparently (at least on iOS 7), the way scrollbar is displayed is by adding two UIImageView(s). So the following trick will change the color to red.

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

