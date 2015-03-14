object Heading {
    val all = Array('N', 'E', 'S', 'W');
    def validHeading(heading: Char) = all.contains(heading)
}

case class Heading(heading: Char) {
    def get: Char = heading
    def changeClockwise = change(1)
    def changeAntiClockwise = change(-1)

    private def change(direction: Int): Heading = {
        assume(direction == 1 || direction == -1)

        val headingNum: Int = Heading.all.indexOf(heading)
        assert(headingNum >= 0)

        val newHeadingNum = (direction match {
            case 1 => headingNum + 1
            case -1 => headingNum + Heading.all.length - 1
        }) % Heading.all.length

        val newHeading = Heading.all(newHeadingNum)
        assume(Heading.validHeading(newHeading))
        Heading(newHeading)
    }

    override def toString(): String = heading.toString
}

