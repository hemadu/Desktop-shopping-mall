package cn.util;

import java.security.MessageDigest;

public class MD5Util {
    public static String getMD5(String str) {
        StringBuffer buf = new StringBuffer("");
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes("utf-8"));
            byte[] b = md.digest();
            int i;
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0) {
                    i += 256;
                }
                if (i < 16) {
                    buf.append("0");
                }
                buf.append(Integer.toHexString(i));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return buf.toString();
    }

    public static void main(String[] args) throws Exception {

    }
}
