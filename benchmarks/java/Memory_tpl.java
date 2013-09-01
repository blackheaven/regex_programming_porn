import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Memory
{
    public static int NB = 1000000;
    public static void main(String[] argv) throws Exception
    {

        Pattern patterns[] = new Pattern[NB];

        for (int i = 0; i < NB; ++i)
        {
            patterns[i] = Pattern.compile("PATTERN"); // TODO : add MODIFIER
            patterns[i].matcher("").find();
        }
    }
}
