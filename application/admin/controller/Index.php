<?php
namespace app\admin\controller;

use app\common\controller\MyController;
use think\Request;
use think\Validate;
use app\admin\model\Admin as AdminModel;
use app\admin\model\Config as ConfigModel;

class Index extends MyController
{
    private $adminmodel;
    private $configmodel;

    public function __construct()
    {
        parent::__construct();
        $this->adminmodel = new AdminModel();
        $this->configmodel = new ConfigModel();
    }

    public function index()
    {
        $data = $this->adminmodel->get_admin_list();
        // var_dump($data);
        
    	return $this->fetch('/index');
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
        // 模板变量赋值 
        $info = array(
            '操作系统'=>PHP_OS,
            '运行环境'=>$_SERVER["SERVER_SOFTWARE"],
            'PHP运行方式'=>php_sapi_name(),
            'ThinkPHP版本'=>THINK_VERSION.' [ <a href="http://thinkphp.cn" target="_blank">查看最新版本</a> ]',
            '上传附件限制'=>ini_get('upload_max_filesize'),
            '服务器时间'=>date("Y年n月j日 H:i:s"),
            '北京时间'=>gmdate("Y年n月j日 H:i:s",time()+8*3600),
            '服务器域名'=>$request->domain(),
            '服务器IP地址'=>gethostbyname($_SERVER['SERVER_NAME']),
            '剩余空间'=>round((disk_free_space(".")/(1024*1024)),2).'M',
            'PHP版本'=>PHP_VERSION,
            '数据库版本'=>$this->configmodel->get_mysql_version(),
        );
        $this->assign('info',$info);
    	return $this->fetch('/system');
    }

    private function show_404()
    {
    	// 渲染模板输出404
        return $this->fetch('common@/404');
    }
}
