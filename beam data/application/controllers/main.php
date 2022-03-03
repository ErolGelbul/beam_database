<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends CI_Controller {
	 
	 function __construct()
	{
		parent::__construct();	 
		$this->load->database();
		$this->load->helper('url');
		$this->load->library('grocery_CRUD');
		$this->load->library('table');
	}
	
	public function index()
	{	
		$this->load->view('header');
		$this->load->view('home');
	}
	
	public function bands()
	{	
		$this->load->view('header');
		$crud = new grocery_CRUD();
		$crud->set_theme('datatables');
		
		//table name exact from database
		$crud->set_table('bands');
		
		//give focus on name used for operations e.g. Add Order, Delete Order
		$crud->set_subject('Band');
		
		//the columns function lists attributes you see on frontend view of the table
		$crud->columns('BandName', 'BandDesc', 'AgtNo', 'BandStatus');
		
		//the fields function lists attributes to see on add/edit forms.
		//Note no inclusion of invoiceNo as this is auto-incrementing
		$crud->fields('BandName', 'BandDesc', 'AgtNo', 'BandStatus');
		
		//set the foreign keys to appear as drop-down menus
		// ('this fk column','referencing table', 'column in referencing table')
		$crud->set_relation('AgtNo','agents','{AgtGivenName} {AgtFamilyName}');
		
		//form validation (could match database columns set to "not null")
		$crud->required_fields('BandName', 'AgtNo', 'BandStatus');
	
		//change column heading name for readability ('columm name', 'name to display in frontend column header')
		$crud->display_as('BandNo', 'No');
		$crud->display_as('BandName', 'Band Name');
		$crud->display_as('BandDesc', 'Description');
		$crud->display_as('AgtNo','Agent');
		$crud->display_as('BandStatus','Status');
		
		$output = $crud->render();
		$this->bands_output($output);
	}
	
	function bands_output($output = null)
	{
		$this->load->view('bands_view.php', $output);
	}
	
	public function agents()
	{	
		$this->load->view('header');
		$crud = new grocery_CRUD();
		$crud->set_theme('datatables');
		
		$crud->set_table('agents');
		$crud->set_subject('Agent');
		$crud->fields('AgtNo', 'AgtGivenName', 'AgtFamilyName', 'AgtContact');

		$crud->required_fields('AgtNo');
		
		$crud->display_as('AgtNo', 'Agent No');
		$crud->display_as('AgtGivenName', 'Agent Name');
		$crud->display_as('AgtFamilyName', 'Agent Surname');
		$crud->display_as('AgtContact', 'Agent Contact Number');
		
		$output = $crud->render();
		$this->agents_output($output);
	}
	function agents_output($output = null)
	{
		$this->load->view('agents_view.php', $output);
	}

	public function members()
	{	
		$this->load->view('header');
		$crud = new grocery_CRUD();
		$crud->set_theme('datatables');
		
		$crud->set_table('members');
		$crud->set_subject('Member');
	
		$crud->columns('MemID', 'MemTitle', 'MemGivenName', 'MemFamilyName', 'MemJobType', 'BandNo', 'MemStatus');
		$crud->fields('MemID', 'MemTitle', 'MemGivenName', 'MemFamilyName', 'MemJobType', 'BandNo', 'MemStatus');
		
		$crud->set_relation('BandNo','bands','{BandName}');
		
		$crud->required_fields('MemID', 'BandNo');
		
		$crud->display_as('MemID', 'ID');
		$crud->display_as('MemTitle', 'Title');
		$crud->display_as('MemGivenName', 'Member Name');
		$crud->display_as('MemFamilyName', 'Member Surname');
		$crud->display_as('MemJobType', 'Job Type');
		$crud->display_as('BandNo', 'Band');
		$crud->display_as('MemStatus', 'Status');
		
		$output = $crud->render();
		$this->members_output($output);
	}
	
	function members_output($output = null)
	{
		$this->load->view('members_view.php', $output);
	}
	
	
	public function stages()
	{	
		$this->load->view('header');
		$crud = new grocery_CRUD();
		$crud->set_theme('datatables');
		
		$crud->set_table('stages');
		$crud->set_subject('Stage');
	
		$crud->columns('StageNo', 'StageName', 'StageBackCapacity');
		$crud->fields('StageNo', 'StageName', 'StageBackCapacity');
		$crud->required_fields('StageNo');
		
		$crud->display_as('StageNo', 'Stage Number');
		$crud->display_as('StageName', 'Stage Name');
		$crud->display_as('StageBackCapacity', 'Backstage Capacity');
		
		$output = $crud->render();
		$this->stages_output($output);
	}
	
	function stages_output($output = null)
	{
		$this->load->view('stages_view.php', $output);
	}

	public function performances()
	{	
		$this->load->view('header');
		$crud = new grocery_CRUD();
		$crud->set_theme('datatables');
		
		$crud->set_table('performances');
		$crud->set_subject('Performance');
	
		$crud->columns('PerfNo', 'StageNo', 'PerfDate', 'PerfTime', 'BandNo');
		$crud->fields('PerfNo', 'StageNo', 'PerfDate', 'PerfTime', 'BandNo');
		
		$crud->set_relation('StageNo','stages','StageNo');
		$crud->set_relation('BandNo','bands','{BandName} ({BandStatus})');
	
		$crud->required_fields('StageNo', 'PerfDate', 'PerfTime', 'BandNo');
		
		$crud->display_as('PerfNo', 'No');
		$crud->display_as('StageNo', 'Stage');
		$crud->display_as('PerfDate', 'Date');
		$crud->display_as('PerfTime', 'Time');
		$crud->display_as('BandNo', 'Band & Status');
		
		$output = $crud->render();
		$this->performances_output($output);
	}
	
	function performances_output($output = null)
	{
		$this->load->view('performances_view.php', $output);
	}

}
