class wr_rd_sequence extends uvm_sequence#(mem_seq_item);

  mem_seq_item seq_item;

  `uvm_object_utils(wr_rd_sequence)

  function new(string name = "wr_rd_sequence");
    super.new(name);
  endfunction

  virtual task body();

    seq_item = mem_seq_item::type_id::create("seq_item");

    start_item(seq_item);
    seq_item.wr_en = 1;
    seq_item.addr = 2;
    seq_item.wdata = 4;
    `uvm_info("SEQ", $sformatf("ISSUED WRITE @ %0t ns addr : %d & wdata : %d",$time, seq_item.addr, seq_item.wdata), UVM_NONE);
    finish_item(seq_item);
    
    start_item(seq_item);
    seq_item.wr_en = 0;
    seq_item.rd_en = 1;
    seq_item.addr = 2;
    `uvm_info("SEQ", $sformatf("ISSUED READ @ %0t ns addr : %d & rdata : %d",$time, seq_item.addr, seq_item.rdata), UVM_NONE);
    finish_item(seq_item);

  endtask

endclass
