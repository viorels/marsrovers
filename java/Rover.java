public class Rover {
	private final Location location;
	private final Heading heading;
	private final Plateau plateau;

	enum Instruction {
		L { void executeOn(Rover r) throws Exception { r.left(); } },
		R { void executeOn(Rover r) throws Exception { r.right(); } },
		M { void executeOn(Rover r) throws Exception { r.move(); } };
		abstract void executeOn(Rover r) throws Exception;
	}
	
	public Rover(int x, int y, char heading, Plateau plateau) throws Exception {
		this.location = new LocationInPlateau(x, y, plateau);
		this.heading = new Heading(heading); 
		this.plateau = plateau;
	}
	
	public void left() throws Exception {
		heading.changeAntiClockwise();
	}
	
	public void right() throws Exception {
		heading.changeClockwise();
	}
	
	public void move() throws Exception {
		int[] delta = plateau.deltaForHeading(heading);
		location.moveWith(delta[0], delta[1]);
	}
	
	public void execute(char instruction) throws Exception {
		try {
			Instruction.valueOf(String.valueOf(instruction)).executeOn(this);
		}
		catch (IllegalArgumentException e) {
			throw new Exception("invalid instruction");
		}
	}
	
	public void execute(String instructions) throws Exception {
		for (char instruction : instructions.toCharArray()) {
			execute(instruction);
		}
	}

	public Heading getHeading() {
		return heading;
	}

	public Location getLocation() {
		return location;
	}

	public Plateau getPlateau() {
		return plateau;
	}
	
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(location.getX());
		sb.append(" ");
		sb.append(location.getY());
		sb.append(" ");
		sb.append(heading.get());
		
		return sb.toString();
	}
}
