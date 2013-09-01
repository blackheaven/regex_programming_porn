import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Benchmark
{
    public static void main(String[] argv) throws Exception
    {
        Integer count = 0;
        Pattern p = Pattern.compile("PATTERN"); // TODO : add MODIFIER

        Scanner scanner = new Scanner(System.in);
 
        String content = "";
        while (scanner.hasNextLine())
        {
            String line = scanner.nextLine();
            content = content.concat(line);
        }

          scanner.close();

        Matcher m = p.matcher(content);

        while (m.find())
            ++count;

        System.out.println(count);
    }
}
