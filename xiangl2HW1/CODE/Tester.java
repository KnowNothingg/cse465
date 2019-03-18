import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Scanner;

/*
 * Ling Xiang
 * xiangl2 
 * CSE465 HW1 
 * DUE Date: 2/11/2019
 * Z+- interpreter
 */


public class Tester {
	
	static HashMap<String, Integer> integer = new HashMap<String, Integer>();
	static HashMap<String, String> str = new HashMap<String, String>();

	public static void main(String[] args) throws FileNotFoundException {
		// TODO Auto-generated method stub
		
		String fileName = args[0];
		File file = new File(fileName);
		Scanner sc = new Scanner(file);
		int lineCount = 0;
		
		
		while(sc.hasNextLine()) {
			lineCount++;
			String s = sc.nextLine();
			String[] array =  s.split(" ");
			
			if(array[0].contains("PROC")) {
				System.out.println("Run Time Error: " + lineCount);	
				System.exit(0);
			}
			
			if(array[0].equals("FOR")) {
				Forloop(s,lineCount);
			} else if (array[0].equals("PRINT")) {
				if(integer.containsKey(array[1])) {
					System.out.println(array[1] + " = " + integer.get(array[1]));
				} else if(str.containsKey(array[1])) {
					System.out.println(array[1] + " = " + str.get(array[1]));
				} else {
					// if two hashmaps do not have key, print error
					System.out.println("Run Time Error: " + lineCount);	
					System.exit(0);
				}
			} else {
				Assign(array, lineCount);
			}
		}
		sc.close();
	}
	
	// executing for loop
	public static void Forloop(String s, int lineCount) {

		// find the running time, 用 substring 去掉 for 后面的第一个空格，从而找到下一个空格，以此得出loop多少次
		String space = s.substring(4);
		int time = Integer.parseInt(s.substring(4, 4 + space.indexOf(" ")));
		s = s.substring(6, s.lastIndexOf("ENDFOR"));
		s = s.trim();
		
		for(int t = 0; t < time; t++) {
			String[] line = s.split(";");
			for(int n = 0; n < line.length; n++) {
				if(line[n].trim().substring(0, 3).equals("FOR")) {
					String nextFor = s.substring(s.indexOf("FOR"));
					Forloop(nextFor, lineCount);
				}
				if( line[n].trim().substring(0, 6).equals("ENDFOR") && line[n].length() >= 13) {
					String noEnd = line[n].replace("ENDFOR", "").trim();
					Assign(noEnd.split(" "), lineCount);
				} else if (line[n].trim().substring(0, 3).equals("FOR") && line[n].length() >= 10) {
						
				} else if (line[n].trim().substring(0, 6).equals("ENDFOR") && line[n].length() <= 7) {
					
				}
				else {
					Assign(line[n].trim().split(" "), lineCount);
				}
			}
		}
	}
	
	
	// assign values to it's variable in hashmap
	public static void Assign(String[] array, int lineCount) {
		// checking if variable and value are the same type, otherwise print error and exit the program. 
		// int += string; int -= string; int *= string
		// string += int, string -= int, string -= 
		if(array[2].contains("\"")) {
			array[2] = array[2].replaceAll("\"", "");
		} 
		
		
		if(array[0].equals("PRINT") || array[0].equals("FOR") || array[0].equals("ENDFOR") || 
				array[0].equals("PROG") || array[0].equals("ENDPROG") || array[0].equals("CALL")) {
			System.out.println("RUN TIME ERROR: LINE " + lineCount);
			System.exit(0); 
		} else if(!array[0].matches("[a-zA-Z]+")) {
			System.out.println("RUN TIME ERROR: LINE " + lineCount);
			System.exit(0); 
		}
		
		if(array[1].equals("=")) {
			if(integer.containsKey(array[0])) {	// already a int key
				if(isInt(array[2])) {		// A = 1
					integer.put(array[0], Integer.parseInt(array[2]));
				} else if(!isInt(array[2]) && integer.containsKey(array[2])) { // A = B(int)
					integer.put(array[0], integer.get(array[2])); 
				} else if(!isInt(array[2]) && !str.containsKey(array[2])) {	// A = "ABC";
					integer.remove(array[0]);  
					str.put(array[0], array[2]);
				} else if (!isInt(array[2]) && str.containsKey(array[2])) {	// A = B(str)
					integer.remove(array[0]);
					str.put(array[0], str.get(array[2]));
				}
			} else if(!integer.containsKey(array[0]) && !str.containsKey(array[0])) {		// create a new key
				if(!isInt(array[2]) && !str.containsKey(array[2]) && !integer.containsKey(array[2])) { // A = "ABC";
					str.put(array[0], array[2]);
				} else if (!isInt(array[2]) && str.containsKey(array[2])) {	// A = B(str)
					str.put(array[0], str.get(array[2]));
				} else if (!isInt(array[2]) && integer.containsKey(array[2])) {	// A = B(int)
					integer.put(array[0], integer.get(array[2]));
				} else if (isInt(array[2])) {	// A = 1;
					integer.put(array[0], Integer.parseInt(array[2]));
				} 
			} else if(str.containsKey(array[0])) {	// already a str key
				if (isInt(array[2])) {	// A = 1;
					str.remove(array[0]);
					integer.put(array[0], Integer.parseInt(array[2]));
				} else if (!isInt(array[2]) && integer.containsKey(array[2])) {	// A = B(int)
					str.remove(array[0]);
					integer.put(array[0], integer.get(array[2]));
				} else if (!isInt(array[2]) && !str.containsKey(array[2])) {	// A = "ABC";
					str.put(array[0], array[2]);
				} else if (!isInt(array[2]) && str.containsKey(array[2])) {	// A = B(str)
					str.put(array[0], str.get(array[2]));
				}
			} else {
				System.out.println("RUN TIME ERROR: LINE " + lineCount);
				System.exit(0); 
			}
		}
		
		else if (array[1].equals("*=")) {
			if(integer.containsKey(array[2]) && integer.containsKey(array[0])) { // A *= B;
				integer.put(array[0], integer.get(array[0]) * integer.get(array[2]));
			} else if (isInt(array[2]) && integer.containsKey(array[0])){ // A *= 2;
				integer.put(array[0], integer.get(array[0]) * Integer.parseInt(array[2]));
			} else {
				System.out.println("RUN TIME ERROR: LINE " + lineCount);
				System.exit(0); 
			} 
		}else if (array[1].equals("-=")) {
			if(integer.containsKey(array[2]) && integer.containsKey(array[0])) {
				integer.put(array[0], integer.get(array[0]) - integer.get(array[2]));
			} else if (isInt(array[2]) && integer.containsKey(array[0])){
				integer.put(array[0], integer.get(array[0]) - Integer.parseInt(array[2]));
			} else {
				System.out.println("RUN TIME ERROR: LINE " + lineCount);
				System.exit(0); 
			}
		} else if (array[1].equals("+=")) {
			if(isInt(array[2])) {
					// when int += num, add the number
				integer.put(array[0], integer.get(array[0]) + Integer.parseInt(array[2]));
			} else if (integer.containsKey(array[2]) && integer.containsKey(array[0])) {
					// int += integer, add the number
				integer.put(array[0], integer.get(array[0]) + integer.get(array[2]));
					
			} else if (str.containsKey(array[2]) && str.containsKey(array[0])) {
				// when string += ""
				str.put(array[0], str.get(array[0]) + str.get(array[2]));
			} else if (!str.containsKey(array[2]) && !isInt(array[2]) && str.containsKey(array[0])){
				// A += "A";
				str.put(array[0], str.get(array[0]) + array[2]);
			} else {
				System.out.println("RUN TIME ERROR: LINE " + lineCount);
				System.exit(0); 
			}
		} 
	}
	
	// check if it is a integer, return true if it is an integer, otherwise false. 
	public static boolean isInt(String s) {
		try{  Integer.parseInt(s);
			  return true;
			} catch (NumberFormatException e) {
			  return false;
			}
	}
}
