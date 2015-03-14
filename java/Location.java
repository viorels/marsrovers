
public class Location {
	private int x, y;
	
	public Location(int x, int y) throws Exception {
		this.x = x;
		this.y = y;
	}
	
	public int[] get() {
		int[] xy = new int[2];
		xy[0] = getX();
		xy[1] = getY();
		return xy;
	}
	
	public void set(int x, int y) throws Exception {
		setX(x);
		setY(y);
	}
	
	public void moveWith(int dx, int dy) throws Exception {
		setX(getX() + dx);
		setY(getY() + dy);
	}
	
	public int getX() {
		return x;
	}
	public void setX(int x) throws Exception { // XXX why must it throw ?!!
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) throws Exception { // XXX why must it throw ?!!
		this.y = y;
	}
}
