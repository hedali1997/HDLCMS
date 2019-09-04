<?php 
namespace app\admin\model;
use think\Model;
use think\Db;

class Admin extends Model 
{
	//自定义初始化 
	protected function initialize() 
	{ 
		//需要调用`Model`的`initialize`方法 
		parent::initialize();
		//TODO:自定义的初始化 
	}

	public function get_admin_list()
	{
		return Db::name('admin')->select();
	}
}
