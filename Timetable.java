import java.io.*;

public class Timetable {

    public static void main(String[] args) throws IOException {

        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
        String x = null;

        System.out.println("start reading json");

        while( (x = input.readLine()) != null ) {
            System.out.println(x);
        }

        System.out.println("finished reading json successfully");
    }
}
