import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class HeadingTest {
	Heading heading;

	@Before
	public void setUp() throws Exception {
		this.heading = new Heading('N');
	}
	
	@Test
	public void testValidHeading() {
		char headings[] = {'N', 'E', 'S', 'W'};  
		for ( char heading : headings ) {
			assertTrue(Heading.validHeading(heading));
		}
		assertFalse(Heading.validHeading('V'));
		// assert throw exception ...
	}

	@Test
	public void testChangeClockwise() throws Exception {
		assertEquals('N', heading.get());
		heading.changeClockwise();
		assertEquals('E', heading.get());
		heading.changeClockwise();
		assertEquals('S', heading.get());
		heading.changeClockwise();
		assertEquals('W', heading.get());
		heading.changeClockwise();
		assertEquals('N', heading.get());
	}

	@Test
	public void testChangeAntiClockwise() throws Exception {
		assertEquals('N', heading.get());
		heading.changeAntiClockwise();
		assertEquals('W', heading.get());
		heading.changeAntiClockwise();
		assertEquals('S', heading.get());
		heading.changeAntiClockwise();
		assertEquals('E', heading.get());
		heading.changeAntiClockwise();
		assertEquals('N', heading.get());
	}
	
	@Test
	public void testToString() throws Exception {
		assertEquals("N", this.heading.toString());
		assertEquals("N", ""+this.heading);
	}

}
