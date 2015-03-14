
public class LocationInPlateau extends Location {
	private final Plateau plateau; 

	public LocationInPlateau(int x, int y, Plateau plateau) throws Exception {
		super(x, y);
		this.plateau = plateau;
	}
	
	@Override
	public void setX(int x) throws Exception {
		if (plateau.containsX(x)) {
			super.setX(x);
		}
		else
			throw new Exception("x is not in plateau");
	}

	@Override
	public void setY(int y) throws Exception {
		if (plateau.containsY(y)) {
			super.setY(y);
		}
		else 
			throw new Exception("y is not in plateau");
	}

	public Plateau getPlateau() {
		return plateau;
	}
	
}
