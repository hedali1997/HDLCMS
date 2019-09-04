<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use app\admin\model\Admin;

class Index extends Controller
{

    public function index()
    {
        $admin = new Admin();
        $data = $admin->get_admin_list();
        // var_dump($data);
        
    	return $this->fetch('/index');
    }

    public function info()
    {
    	return $this->fetch('/info');
    }

    public function page()
    {
    	return $this->fetch('/page');
    }

    public function adv()
    {
    	return $this->fetch('/adv');
    }

    public function system()
    {
        $request = Request::instance(); 
        // 获取当前域名 
        $domain = $request->domain();
        // 模板变量赋值 
        $this->assign('domain',$domain);
    	return $this->fetch('/system');
    }

    private function show_404()
    {
    	// 渲染模板输出404
        return $this->fetch('common@/404');
    }
}
