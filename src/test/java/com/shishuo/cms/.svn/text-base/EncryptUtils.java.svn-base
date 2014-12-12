package com.shishuo.cms;
import java.security.MessageDigest;  
import java.security.NoSuchAlgorithmException; 
public class EncryptUtils {
	    /** 
	     * Encrypt string using MD5 algorithm 
	     */  
	    public final static String encryptMD5(String source) {  
	        if (source == null) {  
	            source = "";  
	        }  
	        String result = "";  
	        try {  
	            result = encrypt(source, "MD5");  
	        } catch (NoSuchAlgorithmException ex) {  
	            throw new RuntimeException(ex);  
	        }  
	        return result;  
	    }
	    /** 
	     * Encrypt string using SHA algorithm
	     */  
	    public String encryptSHA(String source) {  
	        if (source == null) {  
	            source = "";  
	        }  
	        String result = "";
	        try {  
	            result = encrypt(source, "SHA");  
	        } catch (NoSuchAlgorithmException ex) {  
	            throw new RuntimeException(ex);  
	        }  
	        return result;  
	    }  
	    /**
	     * Encrypt string 
	     */
	    private static String encrypt(String source, String algorithm)  
	            throws NoSuchAlgorithmException {  
	        byte[] resByteArray = encrypt(source.getBytes(), algorithm);  
	        return toHexString(resByteArray);  
	    }
	    /** 
	     * Encrypt byte array. 
	     */  
	    private static  byte[] encrypt(byte[] source, String algorithm)  
	            throws NoSuchAlgorithmException {  
	        MessageDigest md = MessageDigest.getInstance(algorithm);  
	        md.reset();  
	        md.update(source);  
	        return md.digest();  
	    }  
	    /** 
	     * Get hex string from byte array 
	     */  
	    private static  String toHexString(byte[] res) {  
	        StringBuffer sb = new StringBuffer(res.length << 1);  
	        for (int i = 0; i < res.length; i++) {  
	            String digit = Integer.toHexString(0xFF & res[i]);  
	            if (digit.length() == 1) {  
	                digit = '0' + digit;  
	            }  
	            sb.append(digit);  
	        }  
	        return sb.toString().toUpperCase();  
	    }  
	    
	    public void main(String args[]){

//			System.out.println(EncryptUtils.encrypt("a", "MD5"));
			//md5加密看下面控制台输出
			System.out.println(EncryptUtils.encryptMD5("11"));
		}
	}  

