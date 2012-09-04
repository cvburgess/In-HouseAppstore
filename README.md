# In-House AppStore for iOS
#### An easy solution for distributing apps with iOS Enterprise Developer Program

## Instructions
1. Distribute your apps according to [Apple's Enterprise Distribution Guide][]
2. Upload a folder with the above's contents to your server (http://mysite.com/apps/myapp/)
3. Point the code in the .xcodeproj to your server
4. Distribute the In-House AppStore to anyone you want to have access to your apps via hyperlink

	[Apple's Enterprise Distribution Guide][]: http://developer.apple.com/library/ios/#featuredarticles/FA_Wireless_Enterprise_App_Distribution/Introduction/Introduction.html

## Example Screenshot

![][1]

 [1]: http://cvburgess.aws.af.cm/wp-content/uploads/2012/09/IH-AppStore.png

## Best Practices
1. This app is indented for use with the Enterprise iOS program. As a registered enterprise developer you do not need to gather UDIDs or other device information.
2. Keep your naming consistent. when you export your app, use the file name (case-sensitive) everywhere. The app expects consistant file naming.
3. Fork, modify, customize! The artwork included is only a suggestion and can be easily swapped out.

## License 

(The MIT License)

Copyright (c) 2012 Charles Burgess &lt;cvburgess@gmx.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.