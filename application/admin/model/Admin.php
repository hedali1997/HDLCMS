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

	// 检查当前登录用户
	public function check_admin($name)
	{
		return Db::name('admin')->where('user_name', $name)->find();
	}

	//获取所有管理员的列表
	public function get_admin_list()
	{
		return Db::name('admin')->select();
	}

	// 更新密码
	public function updatepass($id, $password)
	{
		return Db::name('admin')->where('id', $id)->setField('password', $password);
	}
}
