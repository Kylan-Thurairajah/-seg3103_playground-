import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import org.junit.jupiter.api.Test;

import static org.easymock.EasyMock.*;

class TwitterTest {

    @Test
    void actual_call() {

        Twitter twitter = new Twitter();

        boolean actual;

        actual = twitter.isMentionned("me");
        assertEquals(true, actual);
    }

    @Test
    void mock_full_object() {

        Twitter twitter = createMock("twitter", Twitter.class);

        expect(twitter.loadTweet()).andReturn("hello @me");
        expect(twitter.loadTweet()).andReturn("hello @you");
        replay(twitter);

        String actual;

        actual = twitter.loadTweet();
        assertEquals("hello @me", actual);

        actual = twitter.loadTweet();
        assertEquals("hello @you", actual);
    }

    @Test
    void mock_partial_object() {

        Twitter twitter = partialMockBuilder(Twitter.class)
          .addMockedMethod("loadTweet")
          .createMock();

        expect(twitter.loadTweet()).andReturn("hello @me").times(2);
        replay(twitter);

        boolean actual;

        actual = twitter.isMentionned("me");
        assertEquals(true, actual);

        actual = twitter.isMentionned("you");
        assertEquals(false, actual);
    }

    @Test
    void isMentionned_lookForAtSymbol() {
        Twitter twitter = createMock("twitter", Twitter.class);
        expect(twitter.isMentionned("me")).andReturn(true).anyTimes();
        replay(twitter);
        assertEquals(true, twitter.isMentionned("me"));
    }

    @Test
    void isMentionned_dontReturnSubstringMatches() {
        Twitter twitter= createMock("twitter", Twitter.class);

        expect(twitter.isMentionned("meat")).andReturn(true).anyTimes();
        expect(twitter.isMentionned("me")).andReturn(false).anyTimes();

        
        replay(twitter);

        assertEquals(true, twitter.isMentionned("meat"));
        assertEquals(false, twitter.isMentionned("me"));
    }

    @Test
    void isMentionned_superStringNotFound() {

        Twitter twitter= createMock("twitter", Twitter.class);


        expect(twitter.isMentionned("meat")).andReturn(false).anyTimes();
        expect(twitter.isMentionned("me")).andReturn(true).anyTimes();


        replay(twitter);

        assertEquals(false, twitter.isMentionned("meat"));
        assertEquals(true, twitter.isMentionned("me"));


      // Assuming a tweet like "hello @me"
      // isMentionned("me") should be true
      // isMentionned("meat") should be false
    }

    @Test
    void isMentionned_handleNull() {
        Twitter twitter= createMock("twitter", Twitter.class);


        expect(twitter.isMentionned("meat")).andReturn(false).anyTimes();
        expect(twitter.isMentionned("me")).andReturn(false).anyTimes();


        replay(twitter);


        assertEquals(false, twitter.isMentionned("meat"));
        assertEquals(false, twitter.isMentionned("me"));



      // Assuming no tweet is available (i.e. null)
      // isMentionned("me") should be false
      // isMentionned("meat") should be false
}
}