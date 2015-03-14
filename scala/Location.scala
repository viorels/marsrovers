class Location(val x: Int, val y: Int) {
    def moveWith(dx: Int, dy: Int): Location = new Location(x + dx, y + dy)
    def moveWith(delta: (Int, Int)): Location = moveWith(delta._1, delta._2)

    override def toString = x + " " + y
}

class LocationInPlateau(x: Int, y: Int, plateau: Plateau) extends Location(x, y) {
    if (! (plateau containsX x))
        throw new Exception("x is not in plateau")
    if (! (plateau containsY y))
        throw new Exception("y is not in plateau")
}