<?php
namespace app\common\controller;

use \think\Controller;
use \think\Session;

class MyController extends Controller
{
	public function __construct()
    {
        parent::__construct();
        $this->check_admin();
    }

    // 检查管理员是否登录
    public function check_admin()
    {
    	// 判断admin作用域下面是否赋值 
    	$flag = Session::has('user_name','admin');
    	// 存在 不进行任何操作
    	if ($flag) {
    		return true;
    	}
    	// 不存在
    	// 跳转到登录页
        $this->redirect('Login/show_login');
        return false;
    }
}