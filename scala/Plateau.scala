object Plateau {
    val deltas: Map[Char, (Int, Int)] = Map(
        'N' -> (0,  1),
        'S' -> (0, -1),
        'W' -> (-1,  0),
        'E' -> (1,  0)
    )

    def deltaForHeading(h: Heading) = deltas(h.get)
}

class Plateau(maxX: Int, maxY: Int) {
    def containsX(x: Int) = 0 to maxX contains x
    def containsY(y: Int) = 0 to maxY contains y
    def contains(l: Location) = containsX(l.x) && containsY(l.y)
}
