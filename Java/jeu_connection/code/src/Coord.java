class Coord { // Classe d'une coordoonée parcouru par l'IA
	public int x;
	public int y;

	Coord(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public boolean equals(Coord c) {
		return (this.x == c.x && this.y == c.y);
	}
}