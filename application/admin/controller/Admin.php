<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use app\admin\model\Admin;

class Admin extends Controller
{

    public function index()
    {
    	return $this->fetch('admin');
    }

    // 显示修改密码页面
    public function editpassword()
    {
    	
    }

    public function updatepass()
    {
    	$data = Request::instance()->post();
    }
}
