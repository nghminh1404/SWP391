package utility;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author SMILY
 */
public class StringMethod {
    public static String EncodingSHA256(String str){
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
        byte[] hash = digest.digest(str.getBytes(StandardCharsets.UTF_8));
        String hexString = DatatypeConverter.printHexBinary(hash);
        return hexString;
    }
}
