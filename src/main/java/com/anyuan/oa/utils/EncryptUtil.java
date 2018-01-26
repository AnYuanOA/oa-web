package com.anyuan.oa.utils;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * @author huyang8
 * 加解密工具类
 */
public class EncryptUtil {

    private static final String KEY_="1234567812345678";

    private static final String IV_="1234567812345678";

    /**
     * 加密
     * @param encryptString
     * @return
     * @throws Exception
     */
    public static String encrypt(String encryptString) {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            int blockSize = cipher.getBlockSize();
            byte[] dataBytes = encryptString.getBytes();
            int plaintextLength = dataBytes.length;
            if (plaintextLength % blockSize != 0) {
                plaintextLength = plaintextLength + (blockSize - (plaintextLength % blockSize));
            }
            byte[] plaintext = new byte[plaintextLength];
            System.arraycopy(dataBytes, 0, plaintext, 0, dataBytes.length);
            SecretKeySpec keyspec = new SecretKeySpec(KEY_.getBytes(), "AES");
            IvParameterSpec ivspec = new IvParameterSpec(IV_.getBytes());
            cipher.init(Cipher.ENCRYPT_MODE, keyspec, ivspec);
            byte[] encrypted = cipher.doFinal(plaintext);
            return new sun.misc.BASE64Encoder().encode(encrypted);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 解密
     * @param desEncryptString
     * @return
     * @throws Exception
     */
    public static String desEncrypt(String desEncryptString) {
        try {
            byte[] encrypted1 = new sun.misc.BASE64Decoder().decodeBuffer(desEncryptString);
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            SecretKeySpec keyspec = new SecretKeySpec(KEY_.getBytes(), "AES");
            IvParameterSpec ivspec = new IvParameterSpec(IV_.getBytes());
            cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);
            byte[] original = cipher.doFinal(encrypted1);
            return new String(original);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
