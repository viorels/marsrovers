case class Rover(location: Location, heading: Heading, plateau: Plateau) {
    def this(x: Int, y: Int, heading: Char, plateau: Plateau) =
        this(new Location(x, y), Heading(heading), plateau)

    def left = this.copy(heading = heading.changeAntiClockwise)
    def right = this.copy(heading = heading.changeClockwise)
    def move = this.copy(
        location = location.moveWith(Plateau.deltaForHeading(heading)))

    def execute(instruction: Char): Rover = {
        instruction match {
            case 'L' => left
            case 'R' => right
            case 'M' => move
        }
    }
    def execute(instructions: String): Rover = {
        instructions.toList.foldLeft(this){_.execute(_)}
    }

    override def toString = location + " " + heading.get
}
