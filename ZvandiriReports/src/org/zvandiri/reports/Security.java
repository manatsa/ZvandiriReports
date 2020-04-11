package org.zvandiri.reports;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class Security {

    static PasswordEncoder passwordEncoder=new BCryptPasswordEncoder(8);

    /**
     *
     * @param plainPassword - the password in plain text that you want to compare to encrypted password
     * @param encryptedPassword - the encrypted password you want to compare to the plain password
     * @return - return a boolean to represent a match
     */
    public  static boolean loginCompare(String plainPassword, String encryptedPassword){
        return passwordEncoder.matches(plainPassword,encryptedPassword);
    }


    /**
     *
     * @param plainPassword - the password to be encoded
     * @return - returns an encoded password as a String
     */
    public  static String encryptPass(String plainPassword){
        return passwordEncoder.encode(plainPassword);
    }



    public static void main(String[]args)
    {
        System.err.println(Security.loginCompare("Manat5achin5","$2a$10$.aE/A8xJxIwpyEulYlz01eZVfCW/IYpWVoGNojqwaUSPI41CYDeuW"));
    }
}
