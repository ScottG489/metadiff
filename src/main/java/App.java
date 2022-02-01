import com.fasterxml.jackson.databind.ObjectMapper;
import udp.parse.UnifiedDiff;
import udp.parse.UnifiedDiffParser;
import udp.parse.util.UnifiedDiffParserCreator;

import java.io.IOException;
import java.util.List;

public class App {
    public static void main(String[] args) throws IOException {
        System.out.println(new App().getDiffInfo(args[0]));
    }

    public String getDiffInfo(String diffContent) throws IOException {
        UnifiedDiffParser unifiedDiffParser =
                new UnifiedDiffParserCreator().create();
        List<UnifiedDiff> unifiedDiffs = unifiedDiffParser.parse(diffContent);
        return new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(unifiedDiffs.get(0));
    }
}
