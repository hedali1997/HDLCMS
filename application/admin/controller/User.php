<?php
namespace app\admin\controller;
use \think\Controller;

class User extends Controller
{

    public function index()
    {
    	return $this->fetch('/index');
    }

    public function editpassword()
    {
    	return $this->fetch('/pass');
    }

    private function show_404()
    {
    	// 渲染模板输出404
        return $this->fetch('common@/404');
    }
}
