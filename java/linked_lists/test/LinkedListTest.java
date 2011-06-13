import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;
import org.junit.Before;
import org.junit.Test;

import java.util.LinkedList;

public class LinkedListTest {

  private LinkedList<Integer> list;

  @Before
  public void setUp() {
    list = new LinkedList<Integer>();
    list.addFirst(1);
    list.addFirst(2);
    list.addFirst(3);
    list.addFirst(4);
  }

  @Test
  public void lastItemShouldBeOne() throws Exception {
    assertThat(list.getLast(), is(equalTo(1)));
  }

  @Test
  public void firstItemShouldBeFour() throws Exception {
    assertThat(list.getFirst(), is(equalTo(4)));
  }

  




}
