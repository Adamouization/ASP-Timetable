import java.io.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;

public class Timetable {

    public static void main(String[] args) throws IOException {
		
		// FIELDS
		JSONParser parser = new JSONParser();
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		StringBuilder sb = new StringBuilder();
        String input = null;
		String myJSON = "";
		Object obj;
		
		// Read clingo pipe input and store in string using StringBuilder
        System.out.println("start reading json");
        while( (input = bf.readLine() ) != null ) {
			sb.append(input);
        }
		myJSON = sb.toString();
        System.out.println("finished reading json successfully");
		
		// parse the input
		try{
			obj = parser.parse(myJSON);
			JSONArray jsonArray = (JSONArray)obj;
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObjectRow = (JSONObject) jsonArray.get(i);
				//String name = (String) jsonObjectRow.get("Name");
				//String address = (String) jsonObjectRow.get("Address");
				//Long telephone = (Long) jsonObjectRow.get("Phone_Number");
				System.out.println(jsonObjectRow.get(1));
			}
			
			
		}
		catch(ParseException pe){
			//System.err.println("error position: " + pe.getPosition());
			//System.err.println(pe);
			pe.printStackTrace();
		}
		System.out.println("end");
    }
}