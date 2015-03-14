import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collection;

public class MarsRovers {
	private Plateau plateau;
	Collection<RoverWithInstructions> roversWithInstructions 
		= new ArrayList<RoverWithInstructions>();

	class RoverWithInstructions {
		public RoverWithInstructions(Rover rover, String instructions) {
			this.rover = rover;
			this.instructions = instructions;
		}
		public Rover rover;
		public String instructions;
	}
	
	public MarsRovers(int maxX, int maxY) {
		plateau = new Plateau(maxX, maxY);
	}
	
	public void addRoversData(int x, int y, char heading, String instructions) 
		throws Exception {
		Rover rover = new Rover(x, y, heading, plateau);
		roversWithInstructions.add(new RoverWithInstructions(rover, instructions));
	}
	
	public Collection<Rover> getRovers() {
		Collection<Rover> rovers = new ArrayList<Rover>();
		for ( RoverWithInstructions roverWithInstrictions : roversWithInstructions ) {
			rovers.add(roverWithInstrictions.rover);
		}
		return rovers;
	}
	
	public void run() {
		for ( RoverWithInstructions roverWithInstrictions : roversWithInstructions ) {
			try {
				roverWithInstrictions.rover.execute(roverWithInstrictions.instructions);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
		
		// read plateau data and instantiate simulation class
		String plateauXY = stdin.readLine();
		String[] plateauXYArray = plateauXY.split(" ");
		int plateauX = Integer.parseInt(plateauXYArray[0]);
		int plateauY = Integer.parseInt(plateauXYArray[1]);
		MarsRovers marsRovers = new MarsRovers(plateauX, plateauY);

		// read rovers with data
		String line;
		while ((line = stdin.readLine()) != null) {
			String instructions = stdin.readLine();
			
			String[] roverLine = line.split(" ");
			int x = Integer.parseInt(roverLine[0]);
			int y = Integer.parseInt(roverLine[1]);
			char heading = (roverLine[2].toCharArray())[0];
			
			marsRovers.addRoversData(x, y, heading, instructions);
		}
		
		// run the simulation
		marsRovers.run();
		
		for (Rover rover : marsRovers.getRovers()) {
			System.out.println(rover);
		}
	}

}
