<?php
namespace app\admin\controller;

use \think\Controller;
use \think\Request;
use \think\Validate;
use \think\Session;
use app\admin\model\Admin as AdminModel;

class Login extends Controller
{
    private $adminmodel;

    public function __construct()
    {
        parent::__construct();
        $this->adminmodel = new AdminModel();
    }
    // 显示登陆页面
    public function show_login()
    {
        return $this->fetch('/login');
    }
    // 退出登录
    public function quit()
    {
    	// 清除admin作用域
    	Session::clear('admin');
    	// 跳转到登录页
        $this->redirect('Login/show_login');
    }
    // 检查登录
    public function check_login() 
    {
        // 获取登陆数据
        $data = Request::instance()->post();
        $err_msg = '';// 初始化错误信息
        // 检查验证码
        if (!captcha_check($data['code']))
        {
            $err_msg .= '验证码错误！';
        };

        $admin = $this->adminmodel->check_admin($data['name']);
        // 验证用户名
        if (empty($admin)) {
            $err_msg .= '用户名不存在！';
        }
        // 验证密码
        if (!password_verify($data['password'],$admin['password'])) {
            $err_msg .= '密码错误！';
        }
        // 错误跳转
        if (!empty($err_msg)) {
            $this->assign('err_msg',$err_msg);
            return $this->fetch('/login');
        }

        // 正确
        // 保存管理员信息 在admin作用域
        Session::set('user_name', $admin['user_name'], 'admin');
        Session::set('user_id', $admin['id'], 'admin');
        Session::set('user_level', $admin['level'], 'admin');

        // 跳转到首页
        $this->redirect('/admin/index');

    }
}