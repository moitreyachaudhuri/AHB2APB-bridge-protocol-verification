class apb_driver extends uvm_driver #(apb_xtn);

	//factory registration
	`uvm_component_utils(apb_driver)

	virtual apb_if.APB_DR_MP vif;

	apb_xtn xtn;

	apb_agent_config apb_cfg;

	extern function new(string name="APB_DRIVER",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase);
	extern task send_to_dut(apb_xtn xtn);	

endclass

//---------Constructor-----------//
function apb_driver::new(string name="APB_DRIVER",uvm_component parent);
	super.new(name,parent);
endfunction

//----------Build Phase---------//
function void apb_driver::build_phase(uvm_phase phase);
	super.build_phase(phase);

	if(!uvm_config_db #(apb_agent_config)::get(this,"","apb_agent_config",apb_cfg))
		`uvm_fatal("DRIVER","cannot get config data");
	super.build_phase(phase);
endfunction

//---------------Connect Phase-------------//
function void apb_driver::connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	vif=apb_cfg.vif;
endfunction
