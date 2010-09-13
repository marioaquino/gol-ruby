describe("Evolution", function() {
	beforeEach(function() {
		loadFixtures('spec/javascripts/fixtures/evolution.html');
	});
	
	it("should count live cells", function() {
		expect(getLiveCells()).toEqual(["0_0", "0_2", "1_0", "1_1"]);
	});
	
	it("should make dead cells alive", function() {
		expect($("#0_1")).not.toHaveClass("flip");
		revive($("#0_1"));
		expect($("#0_1")).toHaveClass("flip");
	});
	
	it("should make live cells dead", function() {
		expect($("#0_0")).toHaveClass("flip");
		kill($("#0_0"));
		expect($("#0_0")).not.toHaveClass("flip");
	});
	
	it("should flip all cells based on live cells list", function() {
		var living_cells = ["0_1", "0_2", "0_3", "1_0"];
		evolve(living_cells);
		var cell;
		for(cell in living_cells) {
			expect($("#" + living_cells[cell])).toHaveClass("flip");
		}
		var dead_cells = ["0_0", "1_1", "1_2", "1_3"];
		for(cell in dead_cells) {
			expect($("#" + dead_cells[cell])).not.toHaveClass("flip");
		}
	});
});