MagicKit.framework
========

`MagicKit.framework` is an easy-to-use wrapper around the [`libmagic`](http://www.darwinsys.com/file/) file identification library. It provides a high-level Objective-C interface and deals in Foundation types (NSString, NSData, et al).

`MagicKit.framework` is available for both OS X (as a framework) or iOS as a static library and header file. `MagicKit.framework` consists of a single class, `MagicKit`. It has six class methods, listed below in descending order of convenience.

    + (NSString *)mimeTypeForFileAtPath:(NSString *)path;
    + (NSString *)descriptionForFileAtPath:(NSString *)path;

    + (NSString *)mimeTypeForData:(NSData *)data;
    + (NSString *)descriptionForData:(NSData *)data;

    + (NSString *)descriptionForFileAtPath:(NSString *)path decompress:(BOOL)decompress mimeType:(BOOL)mimeType;
    + (NSString *)descriptionForData:(NSData *)data decompress:(BOOL)decompress mimeType:(BOOL)mimeType;

These methods will return either a MIME type, such as:

* `application/xml; charset=us-ascii` 
* `video/x-msvideo; charset=binary` 

Or a textual description, respectively:

* `XML  document text` 
* `RIFF (little-endian) data, AVI, 624 x 352, 23.98 fps, video: XviD, audio: MPEG-1 Layer 3 (stereo, 48000 Hz)`)

`MagicKit` can also decompress compressed files and hence attempt to determine the contents within.

`MagicKit.framework` is [MIT](http://www.opensource.org/licenses/mit-license.html)-licensed. `libmagic` is [BSD](http://www.opensource.org/licenses/bsd-license.php)-licensed. 