//
//  FLImageView.h
//  FullyLoaded
//
//  Created by Anoop Ranganath on 1/1/11.
//  Copyright 2011 Anoop Ranganath. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import <UIKit/UIKit.h>


@interface FLImageView : UIImageView

@property (nonatomic) BOOL autoresizeEnabled;

// If YES, the view will show a centered activity indicator while the photo loads. You can customize the
// appearance of the activity indicator using through the activityIndicator property. The indicator is lazy-loaded
// after showsLoadingActivity is set to YES
@property (nonatomic) BOOL showsLoadingActivity;
@property (nonatomic, readonly) UIActivityIndicatorView *activityIndicatorView;


// If YES, the URL will be unscheduled for download whenever prepareForReuse is called
@property (nonatomic) BOOL shouldUnscheduleURLOnReuse;

- (void)loadImageAtURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage;
- (void)loadImageAtURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage;
- (void)cancelLoad;

// Called whenever the view's final image is set. If fromCache is YES, the image was loaded from the image cache
// Base implementation does nothing. Sublclasses can override.

- (void)didPopulateImage:(BOOL)fromCache;

@end
