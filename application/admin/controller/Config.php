<?php
namespace app\admin\controller;

use app\common\controller\MyController;
use think\Request;
use think\Validate;
use app\admin\model\Admin as AdminModel;
use app\admin\model\Config as ConfigModel;

class Config extends MyController
{
    private $configmodel;

    public function __construct()
    {
        parent::__construct();
        $this->configmodel = new ConfigModel();
    }

    public function index()
    {
        $config = $this->configmodel->get_config();
        $this->assign('config',$config);
        return $this->fetch('/config');
    }

    public function update_config()
    {
        $config_data = Request::instance()->post();
        $row = $this->configmodel->update_config($config_data);
        if ($row > 0) {
            $this->success('修改成功！', 'Config/index');
        } else {
            $this->error('修改失败！');
        }
    }

}