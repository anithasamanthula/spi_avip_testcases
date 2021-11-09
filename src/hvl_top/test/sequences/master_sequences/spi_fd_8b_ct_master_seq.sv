`ifndef SPI_FD_8B_CT_MASTER_SEQ_INCLUDED_
`define SPI_FD_8B_CT_MASTER_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// class: extended class from base class
//--------------------------------------------------------------------------------------------
class spi_fd_8b_ct_master_seq extends master_base_seq;

  //register with factory so can use create uvm_method 
  //and override in future if necessary 

   `uvm_object_utils(spi_fd_8b_ct_master_seq)

  //---------------------------------------------
  // Externally defined tasks and functions
  //---------------------------------------------

   extern function new (string name="spi_fd_8b_ct_master_seq");

   extern virtual task body();
endclass:spi_fd_8b_ct_master_seq

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_sequence class object
//
// Parameters:
//  name - instance name of the config_template
//-----------------------------------------------------------------------------
function spi_fd_8b_ct_master_seq::new(string name="spi_fd_8b_ct_master_seq");
  super.new(name);
endfunction:new

//-----------------------------------------------------------------------------
//task:body
//based on the request from driver task will drive the transaction
//-----------------------------------------------------------------------------
task spi_fd_8b_ct_master_seq::body(); 
  req=master_tx::type_id::create("req");
  //for(int i=0; i < 8; i++)
  repeat(4)
  begin
		start_item(req);
    if(!req.randomize () with { req.master_out_slave_in.size==1;})
    `uvm_fatal(get_type_name(),"Randomization failed")
    req.print();
    finish_item(req);
  end
  //start_item(req);
  //if(!req.randomize () with {req.master_out_slave_in.size()==2;})
    //`uvm_fatal(get_type_name(),"Randomization failed")
  //finish_item(req);
endtask:body

`endif

