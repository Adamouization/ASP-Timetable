import java.io.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;

/**
*
*/
public class Timetable {

    public static void main(String[] args) throws IOException {
		
		// FIELDS
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in)); 	// read pipe input
		StringBuilder sb = new StringBuilder(); 									// build final string storing JSON input
        String input = null;														// temporarily store buffered reader input
		String myJSON = "";															// store JSON input
		
		
		// Read clingo pipe input and store it in a string using StringBuilder
        System.out.println("Start reading JSON input");
        while((input = bf.readLine()) != null ) {
			sb.append(input);
        }
		myJSON = sb.toString();
        System.out.println("Successfully read/stored JSON inptut");
		
		// parse the input
		JSONParser parser = new JSONParser();
		try{
			Object obj = parser.parse(myJSON);
			//JSONArray array = (JSONArray)obj;
			JSONArray array = (JSONArray)obj;
			System.out.println(array.get(0));
			
			JSONObject obj2 = (JSONObject)array.get(1);
			
			//System.out.println(array.get(1));
		}
		catch (ParseException pe){
			System.err.println("position: " + pe.getPosition());
			System.err.println(pe);
		}
    }
}

/*
JSONParser parser = new JSONParser();
Object obj  = parser.parse(content);
JSONArray array = new JSONArray();
array.add(obj);
*/