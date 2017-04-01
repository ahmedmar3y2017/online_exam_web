/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.Arrays;
import java.util.Collections;
import java.util.StringTokenizer;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class helper {
    
    static StringTokenizer st;
    static  String[]test2;
    
    public static Integer[] randQ(int n) {

        Integer[] arr = new Integer[n];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = i;
        }
        Collections.shuffle(Arrays.asList(arr));

        return arr;
    }
   
    public static String[] ans(question q){
        int n=0;
         st = new StringTokenizer(q.getAnswers() , "$");
                while (st.hasMoreTokens()) {
                    test2[n++] = st.nextToken().trim();
                }
                return test2;
    }
    
}
