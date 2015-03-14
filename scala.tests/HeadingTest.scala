
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.Assert._

class HeadingTest {
	var heading: Heading = new Heading('N')

	@Before
	def setUp() {
		heading = new Heading('N')
	}
	
	@Test
	def testValidHeading() {
                val headings = Array('N', 'E', 'S', 'W')
		headings.foreach { h: Char =>
                    assertTrue(Heading.validHeading(h))
                }
		assertFalse(Heading.validHeading('V'))
                // assert throw exception ...
	}

	@Test
	def testChangeClockwise() {
		assertEquals('N', heading.get);
		heading.changeClockwise;
		assertEquals('E', heading.get);
		heading.changeClockwise;
		assertEquals('S', heading.get);
		heading.changeClockwise;
		assertEquals('W', heading.get);
		heading.changeClockwise;
		assertEquals('N', heading.get);
	}

	@Test
	def testChangeAntiClockwise() {
		assertEquals('N', heading.get);
		heading.changeAntiClockwise;
		assertEquals('W', heading.get);
		heading.changeAntiClockwise;
		assertEquals('S', heading.get);
		heading.changeAntiClockwise;
		assertEquals('E', heading.get);
		heading.changeAntiClockwise;
		assertEquals('N', heading.get);
	}

	@Test
	def testToString() {
		assertEquals("N", this.heading.toString());
		assertEquals("N", ""+this.heading);
	}

}
