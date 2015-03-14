import scala.io.Source

object MarsRovers {
    def simulate(file: Option[String]) {
        val input = file match {
        	case Some(file) => Source.fromFile(file)
        	case None => Source.fromInputStream(System.in)
        }

        val lines = input.getLines
        val plateauXY = lines.next.trim.split("\\s")
        val plateau = new Plateau(plateauXY(0).toInt, plateauXY(1).toInt)

        val rovers = lines grouped 2 withPartial false map { roverInfo =>
            val (start, instructions) = (roverInfo(0), roverInfo(1))
            val (x, y, h) = parseRover(start)
            (new Rover(x, y, h, plateau), instructions.trim)
        }

        // run the simulation
        val roversAfter = rovers.map { rover: (Rover, String) =>
            rover._1.execute(rover._2)
        }

        roversAfter.foreach(println);
    }

    def parseRover(start: String): (Int, Int, Char) = {
        val roverInfo = start.trim.split("\\s")
        val x = roverInfo(0).toInt
        val y = roverInfo(1).toInt
        val heading = roverInfo(2)(0)
        (x, y, heading)
    }

    def main(args: Array[String]) {
    	val fileArg = if (args.length > 0) Some(args(0)) else None  
        simulate(fileArg)
    }
}


