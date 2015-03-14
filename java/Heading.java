
/**
 * Simple heading class that knows how to rotate itself clockwise or 
 * anti-clockwise.
 * 
 * @author vio
 *
 */

public class Heading {
    private char heading;
    final static private char headings[] = {'N', 'E', 'S', 'W'};

    public Heading(final char heading) throws Exception {
    	this.set(heading);
    }
    
    public void set(final char heading) throws Exception {
    	if (Heading.validHeading(heading)) {
    		this.heading = heading;
    	}
    	else 
    		throw new Exception("invalid heading");
    }
    
    public char get() {
    	return this.heading;
    }
    
    public static boolean validHeading(final char heading) {
    	boolean valid = false;
    	for (char validHeading : Heading.headings) {
    		if (heading == validHeading) {
    			valid = true;
    		}
    	}
    	return valid;
    }
    
    public void change(final int direction) throws Exception {
    	assert direction == 1 || direction == -1;
    	
    	// find the index of the heading in the ordered headings list
    	int numHeading = 0;
    	for (char heading : Heading.headings) {
    		if (heading == this.heading) {
    			break;
    		}
    		else {
    			numHeading++;
    		}
    	}
    	assert numHeading < Heading.headings.length : "heading not found";
    	
    	numHeading += direction; // increment/decrement with 1 as requested
    	if (numHeading < 0 || numHeading >= Heading.headings.length) {
	    	// decrement/increment with length in order to normalize it
	   		numHeading -= direction * Heading.headings.length;
    	}
        assert 0 <= numHeading && numHeading < Heading.headings.length 
		: "invalid heading after change";

    	this.set(Heading.headings[numHeading]);
    }
    
    public void changeClockwise() throws Exception {
    	this.change(+1);
    }

    public void changeAntiClockwise() throws Exception {
    	this.change(-1);
    }

    public String toString() {
    	return Character.toString(this.get());
    }
}
