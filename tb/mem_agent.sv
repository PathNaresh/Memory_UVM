class mem_agent extends uvm_agent;
  `uvm_component_utils(mem_agent)

  mem_driver    driver;
  mem_sequencer sequencer;
  mem_monitor   monitor;

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor = mem_monitor::type_id::create("monitor", this);
    if(get_is_active() == UVM_ACTIVE) begin
      driver    = mem_driver::type_id::create("driver", this);
      sequencer = mem_sequencer::type_id::create("sequencer", this);
    end
  endfunction : build_phase

  function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction : connect_phase

endclass : mem_agent
