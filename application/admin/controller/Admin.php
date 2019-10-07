<?php
namespace app\admin\controller;

use app\common\controller\MyController;
use \think\Request;
use \think\Validate;
use app\admin\model\Admin as AdminModel;

class Admin extends MyController
{
    private $adminmodel;

    public function __construct()
    {
        parent::__construct();
        $this->adminmodel = new AdminModel();
    }

    public function index()
    {
    	return $this->fetch('/admin');
    }

    // 显示修改密码页面
    public function editpassword()
    {
    	return $this->fetch('/pass');
    }

    public function updatepass()
    {
    	$data = Request::instance()->post();
        // 判断旧密码是否正确
        
        // 验证两次输入是否一致
        if ($data['newpass'] != $data['renewpass']) {
            // 两次输入密码不一致
        }
        // 两次输入一致，修改密码
        // 加密
        $password = password_hash($data['newpass'], PASSWORD_DEFAULT);
        $row = $this->adminmodel->updatepass(1, $password);
        if ($row > 0) {
            // 修改成功
            return '修改成功';
        }
    }
}
