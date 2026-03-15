package samples.roots;

import com.intuit.karate.junit5.Karate;

class RootsRunner {

    @Karate.Test
    Karate testRoots() {
        return Karate.run("roots").relativeTo(getClass());
    }

}
