package adder_pkg;
import "DPI-C" function int golden_add_model(int ip1, int ip2);
 `include "transaction.sv"
 `include "generator.sv"
 `include "driver.sv"
 `include "monitor.sv"
 `include "scoreboard.sv"
 `include "agent.sv"
 `include "env.sv"
endpackage: adder_pkg

