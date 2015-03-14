import java.util.HashMap;

public class Plateau {
	private final int maxX, maxY;
	final static HashMap<Character, int[]> deltas = new HashMap<Character, int[]>(4);
	
	static {
		int[] N = { 0,  1};
		deltas.put('N', N);
		int[] S = { 0, -1};
		deltas.put('S', S);
		int[] W = {-1,  0};
		deltas.put('W', W);
		int[] E = { 1,  0};
		deltas.put('E', E);
	}
	
	public Plateau(final int maxX, final int maxY) {
		this.maxX = maxX;
		this.maxY = maxY;
	}
	
	public boolean containsLocation(Location location) {
		return containsX(location.getX()) && containsY(location.getY());
	}

	public boolean containsX(int x) {
		return 0 <= x && x <= this.maxX;
	}

	public boolean containsY(int y) {
		return 0 <= y && y <= this.maxY;
	}
	
	public int[] deltaForHeading(Heading heading) {
		return deltas.get(heading.get());
	}

	public int getMaxX() {
		return maxX;
	}

	public int getMaxY() {
		return maxY;
	}
}
