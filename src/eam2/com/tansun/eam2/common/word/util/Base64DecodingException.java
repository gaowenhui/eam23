package com.tansun.eam2.common.word.util;


/**
 * Encodes and decodes to and from Base64 notation.
 *
 * <p>
 * Change Log:
 * </p>
 * <ul>
 *  <li>v2.1 - Cleaned up javadoc comments and unused variables and methods. Added
 *   some convenience methods for reading and writing to and from files.</li>
 *  <li>v2.0.2 - Now specifies UTF-8 encoding in places where the code fails on systems
 *   with other encodings (like EBCDIC).</li>
 *  <li>v2.0.1 - Fixed an error when decoding a single byte, that is, when the
 *   encoded data was a single byte.</li>
 *  <li>v2.0 - I got rid of methods that used booleans to set options. 
 *   Now everything is more consolidated and cleaner. The code now detects
 *   when data that's being decoded is gzip-compressed and will decompress it
 *   automatically. Generally things are cleaner. You'll probably have to
 *   change some method calls that you were making to support the new
 *   options format (<tt>int</tt>s that you "OR" together).</li>
 *  <li>v1.5.1 - Fixed bug when decompressing and decoding to a             
 *   byte[] using <tt>decode( String s, boolean gzipCompressed )</tt>.      
 *   Added the ability to "suspend" encoding in the Output Stream so        
 *   you can turn on and off the encoding if you need to embed base64       
 *   data in an otherwise "normal" stream (like an XML file).</li>  
 *  <li>v1.5 - Output stream pases on flush() command but doesn't do anything itself.
 *      This helps when using GZIP streams.
 *      Added the ability to GZip-compress objects before encoding them.</li>
 *  <li>v1.4 - Added helper methods to read/write files.</li>
 *  <li>v1.3.6 - Fixed OutputStream.flush() so that 'position' is reset.</li>
 *  <li>v1.3.5 - Added flag to turn on and off line breaks. Fixed bug in input stream
 *      where last buffer being read, if not completely full, was not returned.</li>
 *  <li>v1.3.4 - Fixed when "improperly padded stream" error was thrown at the wrong time.</li>
 *  <li>v1.3.3 - Fixed I/O streams which were totally messed up.</li>
 * </ul>
 *
 * <p>
 * I am placing this code in the Public Domain. Do with it as you will.
 * This software comes with no guarantees or warranties but with
 * plenty of well-wishing instead!
 * Please visit <a href="http://iharder.net/base64">http://iharder.net/base64</a>
 * periodically to check for updates or to contribute improvements.
 * </p>
 *
 * @author Robert Harder
 * @author rob@iharder.net
 * @version 2.1
 */
 
import java.io.IOException;

/**
 * Exception that is thrown when an unexpected character is encountered
 * during Base64 decoding.  One could catch this exception and use
 * the unexpected character for some other purpose such as including it
 * with data that comes at the end of a Base64 encoded section of an email
 * message.
 *
 * @author Stephen Ostermiller http://ostermiller.org/contact.pl?regarding=Java+Utilities
 * @since ostermillerutils 1.00.00
 */
public class Base64DecodingException extends IOException {
	private char c;
	/**
	 * Construct an new exception.
	 *
	 * @param message message later to be returned by a getMessage() call.
	 * @param c character that caused this error.
	 *
	 * @since ostermillerutils 1.00.00
	 */
	public Base64DecodingException(String message, char c){
		super(message);
		this.c = c;
	}

		/**
	 * Get the character that caused this error.
	 *
	 * @return the character that caused this error.
	 *
	 * @since ostermillerutils 1.00.00
	 */
	public char getChar(){
		return c;
	}
}
